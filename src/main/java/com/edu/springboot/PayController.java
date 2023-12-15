package com.edu.springboot;

import java.io.File;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.springboot.pay.PayService;
import com.edu.springboot.restboard.CartDTO;
import com.edu.springboot.restboard.IBoardService;
import com.edu.springboot.restboard.MemberDTO;
import com.edu.springboot.restboard.OPjoinDTO;
import com.edu.springboot.restboard.Order2DTO;
import com.edu.springboot.restboard.OrderDTO;
import com.edu.springboot.restboard.ParameterDTO;
import com.edu.springboot.restboard.PointDTO;
import com.edu.springboot.restboard.ProductDTO;
import com.edu.springboot.restboard.ReviewDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import utils.MyFunctions;

@Controller
public class PayController {

	@Autowired
	PayService payService;
	@Autowired
	IBoardService dao;

	@RequestMapping("/member/cart")
	public String cart(Principal principal, Model model) {

		Map<Object, Object> map = payService.memberIndex(principal);
        model.addAttribute("map", map);
		MemberDTO memberDTO = dao.mview(principal.getName());
		
		//장바구니에 담은 목록표시
		List<CartDTO> clist = dao.cartsview(memberDTO.getMidx());
		
		List<ProductDTO> plist = new ArrayList<>();
		for(CartDTO cartDTO : clist) {
			ProductDTO productDTO = dao.pview(cartDTO.getPidx());
			plist.add(productDTO);
		}
		model.addAttribute("plist", plist);
			
		return "member/cart";
	}
	
	@GetMapping("/member/orderResult")
	public String orderresult(Model model, HttpSession session) {
		
		OrderDTO orderDTO = (OrderDTO) session.getAttribute("odto");
		model.addAttribute("odto", orderDTO);
		model.addAttribute("resultMsg", "주문이 성공적으로 처리되었습니다.");
		
		return "member/orderResult";
	}
	
	@PostMapping("/member/orderProc")
	public String orderProc(Principal principal, Model model, HttpSession session, HttpServletRequest req, OrderDTO orderDTO, PointDTO pointDTO) {
		try {
			orderDTO = payService.orderProc(principal, req, orderDTO, pointDTO);
			
			model.addAttribute("odto", orderDTO);
			model.addAttribute("resultMsg", "주문이 성공적으로 처리되었습니다.");
			session.setAttribute("odto", orderDTO);
			session.setAttribute("resultMsg", "주문이 성공적으로 처리되었습니다.");
			return "redirect:/member/orderResult?oidx="+orderDTO.getOidx();
		}catch (Exception e){ 
			e.printStackTrace();
			System.out.println("주문 처리 실패"); 
			model.addAttribute("resultMsg", "주문처리중 오류가 발생했습니다.");
			return "member/orderResult";
    	}	
		
	}
	
//	@PostMapping("/member/orderProc")
//	@Transactional
//	public String orderProc(Principal principal, HttpServletRequest req, Model model, OrderDTO orderDTO, PointDTO pointDTO, HttpSession session) {
//		int resulto1 = 0, resPoint1 = 0, piresult = 0, setsold = 0;
//		List<Integer> resListo2 = new ArrayList<>();
//		List<Integer> resDelCartList = new ArrayList<>();
//		String paymethod = "";
//		try {
//			String user_id = principal.getName(); //로그인아이디 얻어온다. 
//			
//			MemberDTO memberDTO = dao.mview(user_id);
//			
//			orderDTO.setMidx(memberDTO.getMidx());
//			
//			paymethod = req.getParameter("paymethod");
//			orderDTO.setPaymethod(paymethod);
//			orderDTO.setPrice(Integer.parseInt(req.getParameter("oprice")));
//			
//			orderDTO.setReceiver(req.getParameter("m_name"));
//			orderDTO.setR_phone(req.getParameter("phone"));
//			String address = req.getParameter("zip") +" | "+ req.getParameter("addr1") +" _ "+ req.getParameter("addr2");
//			orderDTO.setR_address(address);
//			orderDTO.setMessage(req.getParameter("msg2"));
//			
//			if(paymethod.equals("kakao") || paymethod.equals("toss")) {
//				 resulto1 = dao.payorder(orderDTO);
//			}else {
//				orderDTO.setOwner(req.getParameter("owner"));
//				resulto1 = dao.bankorder(orderDTO);
//			}
//			System.out.println("주문처리1단계결과 : "+resulto1);
//			
//			String[] pidxList = req.getParameter("pidxList").split(",");
//			
//			for(String i : pidxList) {
//				ProductDTO productDTO = dao.pview(Integer.parseInt(i));
//				
//				setsold = dao.setsold(Integer.parseInt(i)); //주문작품sold로 변경
//				System.out.println("작품sold로 변경 결과 : "+setsold);
//				
//				Order2DTO order2DTO = new Order2DTO();
//				
//				order2DTO.setOidx(dao.orderNum(memberDTO.getMidx()));
//				order2DTO.setPidx(Integer.parseInt(i));
//				order2DTO.setAidx(productDTO.getAidx());
//				order2DTO.setPrice(productDTO.getPrice());
//				order2DTO.setMidx(memberDTO.getMidx());
//				
//				int resulto2 = dao.insertorder2(order2DTO); //order2테이블에 삽입결과
//				int resultDelCart = dao.delCart(Integer.parseInt(i)); //주문된 작품 장바구니에서 삭제결과
//				
//				resListo2.add(resulto2);
//				resDelCartList.add(resultDelCart);
//				System.out.println("주문처리2단계결과 : "+resulto2);
//				System.out.println("장바구니 삭제결과 : "+resultDelCart);
//			}
//			
//			int minusPoint = Integer.parseInt(req.getParameter("point"));
//			resPoint1 = dao.minusPoint(minusPoint, memberDTO.getMidx()); //멤버테이블에 포인트사용 반영
//			
//			pointDTO.setMidx(memberDTO.getMidx());
//			pointDTO.setMinus_point(minusPoint);
//			pointDTO.setOidx(dao.orderNum(memberDTO.getMidx()));
//			
//			piresult = dao.pminsert(pointDTO); //포인트테이블에 포인트사용내용 입력
//			System.out.println("포인트테이블에 입력결과 : "+resPoint1+" : "+piresult);
//			
//			int sum1 = 0, sum2 = 0;
//			for(Integer i : resListo2) {sum1 += i;}
//			for(Integer i : resDelCartList) {sum2 += i;}
//			if(resulto1<=0 || resPoint1<=0 || piresult<=0 || setsold<=0 || sum1<resListo2.size() || sum2<resDelCartList.size()) {
//				throw new RuntimeException("주문 처리 중 오류가 발생했습니다.");
//			}
//			model.addAttribute("odto", orderDTO);
//			model.addAttribute("resultMsg", "주문이 성공적으로 처리되었습니다.");
//			session.setAttribute("odto", orderDTO);
//			return "redirect:/member/orderResult";
//			
//		}catch (Exception e){ 
//			e.printStackTrace();
//			System.out.println("주문 처리 실패"); 
//			model.addAttribute("resultMsg", "주문처리중 오류가 발생했습니다.");
//			return "member/orderResult";
//    	}
//	}
	

	@RequestMapping("/member/paynow")
	public String cart(Principal principal, Model model, @RequestParam int pidx) {
		try {
			String user_id = principal.getName(); //로그인아이디 얻어온다.
			MemberDTO memberDTO = dao.mview(user_id);
			ProductDTO productDTO = dao.pview(pidx);
			
			model.addAttribute("pdto", productDTO);
			model.addAttribute("mdto", memberDTO);
		}catch (Exception e){
			System.out.println("주문페이지에서 작품및유저정보 조회 실패");
		}
		return "member/paynow";
	}
	
	@RequestMapping("/member/orderhistory")
	public String orderhistory (Principal principal, Model model, ParameterDTO parameterDTO, HttpServletRequest req) {
		try {
			Map<Object, Object> map = payService.memberIndex(principal);
			
			int midx = dao.mview(principal.getName()).getMidx();
			System.out.println("midx="+ midx);
			
			if(req.getParameter("sWord")!=null) {
				parameterDTO.getSWord().clear();
				for(String str : req.getParameter("sWord").split(" ")) {
					System.out.println(str); parameterDTO.getSWord().add(str);}
			}
			
			parameterDTO.setMidx(midx);
			
			List<OPjoinDTO> oplist = dao.opjoin(parameterDTO);
			System.out.println("oplist="+ oplist);
			
			model.addAttribute("map", map);
			model.addAttribute("oplist", oplist);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
         
		return "member/orderhistory";
	}
	
	@RequestMapping("/member/oview")
	public String oview (Principal principal, Model model, HttpServletRequest req) {
		try {
			Map<Object, Object> map = payService.memberIndex(principal);
			model.addAttribute("map", map);
			
			String oidx = req.getParameter("oidx");
			System.out.println("oidx : "+oidx);
			
			OrderDTO odto = dao.oview(oidx);
			List<OPjoinDTO> oplist2 = dao.opjoin2(oidx);
			String orderdate = dao.orderdate(oidx);
			
			model.addAttribute("oplist2", oplist2);
			model.addAttribute("odto", odto);
			model.addAttribute("orderdate", orderdate);
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("주문상세내역불러오기실패");
		}
         
		return "member/orderview";
	}
	
	@RequestMapping("/member/ohistory")
	public String ohistory () {
         
		return "member/orderview";
	}
	
	@RequestMapping("/member/trackWindow")
	public String editWinddow() {
		return "member/trackWindow";
	}
	
	@PostMapping("/member/reviewWrite.do")
	public String reviewWrite(Principal principal, HttpServletRequest req, Model model, ReviewDTO reviewDTO) {
		
		try {
			//물리적 경로 얻어오기 
			String uploadDir = ResourceUtils.getFile("classpath:static/uploads/").toPath().toString();
			System.out.println("물리적경로:"+uploadDir);
			
			List<String> savedFileNames = new ArrayList();
			
			for(int n=1; n<=3; n++) {
				//전송된 첨부파일을 Part객체를 통해 얻어온다. 
				Part part = req.getPart("ofile"+n);	
				System.out.println(part.getSize());
				if (part.getSize() > 0) { System.out.println("파일있음");
				} else {
					System.out.println("파일 없음. 잘못된 접근. 함수종료");
					return "redirect:/member/apply";
				}
				//파일명 확인을 위해 헤더값을 얻어온다. 
				String partHeader = part.getHeader("content-disposition");
				System.out.println("partHeader="+ partHeader);
				//헤더값에서 파일명 추출을 위해 문자열을 split()한다. 
				String[] phArr = partHeader.split("filename=");
				//따옴표를 제거한 후 원본파일명을 추출한다. 
				String originalFileName = phArr[1].trim().replace("\"", "");
				//파일명을 중복되지 않는 이름으로 변경한다. 
				String savedFileName = MyFunctions.renameFile(uploadDir, originalFileName);
				//전송된 파일이 있다면 서버에 저장한다. 
				if (!savedFileName.isEmpty()) {	 part.write(uploadDir+ File.separator +savedFileName); }
				System.out.println("파일 업로드 성공 / 저장된 파일 이름 : "+savedFileName);
				// 파일명을 리스트에 추가
	            savedFileNames.add(savedFileName);
			}
			
			// reviewDTO 객체에 파일명 할당
	        for (int i = 0; i < savedFileNames.size(); i++) {
	            switch (i + 1) {
	                case 1: reviewDTO.setSfile1(savedFileNames.get(i)); break;
	                case 2: reviewDTO.setSfile2(savedFileNames.get(i)); break;
	                case 3: reviewDTO.setSfile3(savedFileNames.get(i)); break;
	                default: break; // 예외 처리 혹은 다른 로직 추가 가능
	            }
	        }
			
	        System.out.println("파일 업로드 성공 / 저장된 파일 이름(list) : " + savedFileNames);
	        
	        reviewDTO.setMidx(dao.mview(principal.getName()).getMidx());
	        ProductDTO pdto = dao.pview(Integer.parseInt(req.getParameter("pidx")));
	        reviewDTO.setPidx(pdto.getPidx());
	        reviewDTO.setAidx(pdto.getAidx());
	        reviewDTO.setR_content(req.getParameter("rContent").replace("\r\n","</br>"));
	        reviewDTO.setStar(Integer.parseInt(req.getParameter("star")));
	        MemberDTO mdto = dao.mview(principal.getName());)
			reviewDTO.setM_name(mdto.getM_name());
			reviewDTO.setPsfile(pdto.getSfile());
			reviewDTO.setTitle(pdto.getTitle());
			//JDBC연동
	        int result = dao.rinsert(reviewDTO);
			if(result != 0) { System.out.println("jdbc연동 성공");
			} else { System.out.println("실패"); }
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("리뷰업로드 실패");
		}
		
		return "redirect:/member/orderhistory";
	}
	
}
