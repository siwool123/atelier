package com.edu.springboot.member;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.restboard.PointDTO;


@Controller
public class PppController {
	
//	@Autowired
//	PPPayController payServic;
//
//	@RequestMapping("/rest/orderProc")
//	public Order11DTO orderProc(Order11DTO order11DTO, PointDTO pointDTO) {
//		
//		System.out.println("메시");
//		try {
//			return order11DTO = payServic.order11Proc(order11DTO, pointDTO);
//			
////			model.addAttribute("odto", orderDTO);
////			model.addAttribute("resultMsg", "주문이 성공적으로 처리되었습니다.");
////			session.setAttribute("odto", orderDTO);
////			session.setAttribute("resultMsg", "주문이 성공적으로 처리되었습니다.");
////			return "redirect:/member/orderResult?oidx="+orderDTO.getOidx();
//		}catch (Exception e){ 
//			e.printStackTrace();
//			System.out.println("주문 처리 실패"); 
////			model.addAttribute("resultMsg", "주문처리중 오류가 발생했습니다.");
//			return order11DTO;
//    	}	
//		
//	}
}
