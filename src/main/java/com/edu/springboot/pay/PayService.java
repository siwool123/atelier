package com.edu.springboot.pay;

import java.io.File;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ResourceUtils;

import com.edu.springboot.restboard.IBoardService;
import com.edu.springboot.restboard.MemberDTO;
import com.edu.springboot.restboard.Order2DTO;
import com.edu.springboot.restboard.OrderDTO;
import com.edu.springboot.restboard.PointDTO;
import com.edu.springboot.restboard.ProductDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import lombok.RequiredArgsConstructor;
import utils.MyFunctions;

@Service
@Transactional
public class PayService {

    @Autowired
	IBoardService dao;
    
    public OrderDTO orderProc(Principal principal, HttpServletRequest req, OrderDTO orderDTO, PointDTO pointDTO) {
    	int resulto1 = 0, resPoint1 = 0, resPoint2 = 0, piresult = 0, setsold = 0;
    	List<Integer> resListo2 = new ArrayList<>();
    	List<Integer> resDelCartList = new ArrayList<>();
    	
		MemberDTO memberDTO = dao.mview(principal.getName());
		String paymethod = req.getParameter("paymethod");
		orderDTO.setMidx(memberDTO.getMidx());
		orderDTO.setPaymethod(paymethod);
		orderDTO.setPrice(Integer.parseInt(req.getParameter("oprice")));
		orderDTO.setReceiver(req.getParameter("m_name"));
		orderDTO.setR_phone(req.getParameter("phone"));
		orderDTO.setPidx(req.getParameter("pidxList"));
		orderDTO.setAdd_point(setsold);
		
		int minusPoint = Integer.parseInt(req.getParameter("point"));
		int addPoint = Integer.parseInt(req.getParameter("futurepoint"));
		
		orderDTO.setMinus_point(minusPoint);
		orderDTO.setAdd_point(addPoint);
		
		String address = req.getParameter("zip") +" | "+ req.getParameter("addr1") +" | "+ req.getParameter("addr2");
		orderDTO.setR_address(address);
		orderDTO.setMessage(req.getParameter("msg2"));
		
		if(paymethod.equals("kakaopay") || paymethod.equals("tosspayments") || paymethod.equals("html5_inicis")) {
			orderDTO.setApinum(req.getParameter("imp_uid"));
			 resulto1 = dao.payorder(orderDTO);
		}else {
			orderDTO.setOwner(req.getParameter("owner"));
			resulto1 = dao.bankorder(orderDTO);
		}
		
		System.out.println("주문처리1단계결과 : "+resulto1);
		
		String[] pidxList = req.getParameter("pidxList").split(",");
		
		for(String i : pidxList) {
			ProductDTO productDTO = dao.pview(Integer.parseInt(i));
			
			setsold = dao.setsold(Integer.parseInt(i)); //주문작품sold로 변경
			System.out.println("작품sold로 변경 결과 : "+setsold);
			
			Order2DTO order2DTO = new Order2DTO();
			
			order2DTO.setOidx(dao.orderNum(memberDTO.getMidx()));
			order2DTO.setPidx(Integer.parseInt(i));
			order2DTO.setAidx(productDTO.getAidx());
			order2DTO.setPrice(productDTO.getPrice());
			order2DTO.setMidx(memberDTO.getMidx());
			
			int resulto2 = dao.insertorder2(order2DTO); //order2테이블에 삽입결과 
			int resultDelCart = dao.delCart(Integer.parseInt(i)); //주문된 작품 장바구니에서 삭제결과
			
			resListo2.add(resulto2);
			resDelCartList.add(resultDelCart);
			System.out.println("주문처리2단계결과 : "+resulto2);
			System.out.println("장바구니 삭제결과 : "+resultDelCart);
		}
		
		
		resPoint1 = dao.memberPoint(minusPoint-addPoint, memberDTO.getMidx()); //멤버테이블에 포인트사용.적립 반영
		int pidx = Integer.parseInt(req.getParameter("pidxList").substring(0, 4));
		pointDTO.setMidx(memberDTO.getMidx());
		pointDTO.setMinus_point(minusPoint);
		pointDTO.setAdd_point(addPoint);
		pointDTO.setOidx(dao.orderNum(memberDTO.getMidx()));
		pointDTO.setPidx(pidx);
		ProductDTO pdto = dao.pview(pidx);
		pointDTO.setTitle(pdto.getTitle());
		pointDTO.setM_name(pdto.getM_name());
		
		piresult = dao.pinsert(pointDTO);  //포인트테이블에 포인트사용/적립 내용 입력
		
		System.out.println("포인트테이블에 입력결과 : "+resPoint1+" : "+piresult);
		
		int sum1 = 0, sum2 = 0;
		for(Integer i : resListo2) {sum1 += i;}
		for(Integer i : resDelCartList) {sum2 += i;}
		if(resulto1<=0 || resPoint1<=0 || piresult<=0 || setsold<=0 || sum1<resListo2.size() || sum2<resDelCartList.size()) {
			throw new RuntimeException("주문 처리 중 오류가 발생했습니다.");
		}
		orderDTO.setOidx(dao.orderNum(memberDTO.getMidx()));
		return orderDTO;
			
	}
    
    public Map<Object, Object> memberIndex (Principal principal) {

    	Map<Object, Object> map = new HashMap<>();
    	
    	MemberDTO memberDTO = dao.mview(principal.getName());
        
        List<OrderDTO> olist = dao.olist(memberDTO.getMidx());
        int sum = 0;
        for(OrderDTO odto : olist) { sum += odto.getPrice();}
        System.out.println("주문작품수 : " + olist.size() + ", 주문합계 : "+sum);
        
        List<OrderDTO> nplist = dao.notPaid(memberDTO.getMidx());
        List<OrderDTO> nslist = dao.notShipped(memberDTO.getMidx());
       System.out.println("입금전 건수 : "+nplist.size() + ", 배송전건수 : "+nslist.size());
        
       List<PointDTO> polist = dao.pointlist(memberDTO.getMidx());
       int psum = 0, msum=0;
       for(PointDTO podto : polist) {
       	psum += podto.getAdd_point();
       	msum += podto.getMinus_point();
       }
       int total = psum-msum;
       int result = dao.mpoint(total);
       System.out.println(total+", 총포인트, 멤버테이블반영결과 : "+result);
       
       map.put("mdto", memberDTO);
       map.put("olist", olist);
       map.put("orderSum", sum);
       map.put("nplistSize", nplist.size());
       map.put("nslistSize", nslist.size());
       map.put("totalPoint", total);
       
       return map;
    }
    
    public String uploadFile (String uploadDir, HttpServletRequest req, Part part) {
    	
    	String savedFileName = "";
    	try {
			System.out.println("물리적경로:"+uploadDir);
			
			String[] phArr = part.getHeader("content-disposition").split("filename="); //헤더값에서 파일명 추출을 위해 문자열을 split()한다. 
			String originalFileName = phArr[1].trim().replace("\"", "");  //따옴표를 제거한 후 원본파일명을 추출한다. 
			savedFileName = MyFunctions.renameFile(uploadDir, originalFileName);
			 
			if (!savedFileName.isEmpty()) {	 part.write(uploadDir+ File.separator +savedFileName); } //전송된 파일이 있다면 서버에 저장한다.
			System.out.println("파일 업로드 성공 / 저장된 파일 이름 : "+savedFileName);
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("리뷰업로드 실패");
		}
       
       return savedFileName;
    }
}
