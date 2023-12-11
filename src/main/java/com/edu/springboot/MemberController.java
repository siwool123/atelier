package com.edu.springboot;

import java.security.Principal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.springboot.restboard.ProductDTO;
import com.edu.springboot.restboard.ReviewDTO;
import com.edu.springboot.restboard.ParameterDTO;
import com.edu.springboot.restboard.ArtistDTO;
import com.edu.springboot.restboard.CartDTO;
import com.edu.springboot.restboard.IBoardService;
import com.edu.springboot.restboard.MemberDTO;
import com.edu.springboot.restboard.Order2DTO;
import com.edu.springboot.restboard.OrderDTO;

import jakarta.servlet.http.HttpServletRequest;
import utils.BoardPage;
import utils.SecurityUtils;

@Controller
public class MemberController {

	@Autowired
	IBoardService dao;

	@RequestMapping("/member/index")
	public String mindex (Principal principal, Model model, MemberDTO memberDTO) {
		
		return "member/index";
	}
	
	@RequestMapping("/member/cart")
	public String cart(Principal principal, Model model, MemberDTO memberDTO) {
		try {
			String user_id = principal.getName(); //로그인아이디 얻어온다.
			memberDTO = dao.mview(user_id);
			List<CartDTO> clist = dao.cartsview(memberDTO.getMidx());
			
			List<ProductDTO> plist = new ArrayList<>();
			for(CartDTO cartDTO : clist) {
				ProductDTO productDTO = dao.pview(cartDTO.getPidx());
				plist.add(productDTO);
			}
			model.addAttribute("plist", plist);
			model.addAttribute("mdto", memberDTO);
		}catch (Exception e){
			System.out.println("장바구니 목록 조회 실패");
		}
		return "member/cart";
	}
	
	@PostMapping("/member/orderProc")
	public String orderProc(Principal principal, HttpServletRequest req, Model model, OrderDTO orderDTO) {
		int result1 = 0;
		List<Integer> resList2 = new ArrayList<>();
		List<Integer> resList3 = new ArrayList<>();
		List<ProductDTO> plist = new ArrayList<>();
		String paymethod = "";
		try {
			String user_id = principal.getName(); //로그인아이디 얻어온다.
			MemberDTO memberDTO = dao.mview(user_id);
			
			orderDTO.setMidx(memberDTO.getMidx());
			paymethod = req.getParameter("paymethod");
			orderDTO.setPaymethod(paymethod);
			orderDTO.setPrice(Integer.parseInt(req.getParameter("oprice")));
			
			orderDTO.setReceiver(req.getParameter("m_name"));
			orderDTO.setR_phone(req.getParameter("phone"));
			String address = req.getParameter("zip") +" | "+ req.getParameter("addr1") +" _ "+ req.getParameter("addr2");
			orderDTO.setR_address(address);
			orderDTO.setMessage(req.getParameter("msg2"));
			
			if(paymethod.equals("kakao") || paymethod.equals("toss")) {
				 result1 = dao.payorder(orderDTO);
			}else if(paymethod.equals("bank")) {
				orderDTO.setOwner(req.getParameter("owner"));
				result1 = dao.bankorder(orderDTO);
			}
		
			System.out.println("주문처리1단계결과 : "+result1);
			
			String[] pidxList = req.getParameter("pidxList").split(",");
			
			for(String i : pidxList) {
				ProductDTO productDTO = dao.pview(Integer.parseInt(i));
				int result3 = dao.setsold(Integer.parseInt(i));
				resList3.add(result3);
				
				plist.add(productDTO);
				Order2DTO order2DTO = new Order2DTO();
				order2DTO.setOidx(orderDTO.getOidx());
				order2DTO.setPidx(Integer.parseInt(i));
				order2DTO.setAidx(productDTO.getAidx());
				order2DTO.setPrice(productDTO.getPrice());
				order2DTO.setMidx(memberDTO.getMidx());
				
				int result2 = dao.insertorder2(order2DTO);
				resList2.add(result2);
			}
			
		}catch (Exception e){ 
			e.printStackTrace();
			System.out.println("주문 처리 실패"); }
		
		model.addAttribute("result1", result1);
		model.addAttribute("resList2", resList2);
		model.addAttribute("resList3", resList3);
		model.addAttribute("plist", plist);
		model.addAttribute("odto", orderDTO);
		
		return "/member/orderResult";
	}
}
