package com.edu.springboot.pay;

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

import com.edu.springboot.restboard.IBoardService;
import com.edu.springboot.restboard.MemberDTO;
import com.edu.springboot.restboard.Order2DTO;
import com.edu.springboot.restboard.OrderDTO;
import com.edu.springboot.restboard.PointDTO;
import com.edu.springboot.restboard.ProductDTO;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

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
		
		int minusPoint = Integer.parseInt(req.getParameter("point"));
		int addPoint = (int)(Integer.parseInt(req.getParameter("oprice"))*0.01);
		resPoint1 = dao.memberPoint(minusPoint-addPoint, memberDTO.getMidx()); //멤버테이블에 포인트사용.적립 반영
		
		pointDTO.setMidx(memberDTO.getMidx());
		pointDTO.setMinus_point(minusPoint);
		pointDTO.setAdd_point(addPoint);
		pointDTO.setOidx(dao.orderNum(memberDTO.getMidx()));
		
		piresult = dao.pinsert(pointDTO); //포인트테이블에 포인트사용/적립 내용 입력
		
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
        
       map.put("mdto", memberDTO);
       map.put("olist", olist);
       map.put("orderSum", sum);
       map.put("nplistSize", nplist.size());
       map.put("nslistSize", nslist.size());
       
       return map;
    }
    
}
