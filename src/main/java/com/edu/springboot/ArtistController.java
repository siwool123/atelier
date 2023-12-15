package com.edu.springboot;

import java.security.Principal;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.pay.PayService;
import com.edu.springboot.restboard.IBoardService;
import com.edu.springboot.restboard.IMemberService;

@Controller
public class ArtistController {

	@Autowired
	IMemberService dao;
	
	@Autowired
	IBoardService dao2;
	
	@Autowired
	PayService payService;

	//작가프로필
	@RequestMapping("artist/artistProfile")
	public String artistProfile(Principal principal, Model model) {
		
		return "artist/artistProfile";
	}
	
	//판매작품등록
	@RequestMapping("artist/addProduct")
	public String addProduct(Principal principal, Model model) {
		return "artist/addProduct";
	}
	
	//판매작품내역
	@RequestMapping("artist/sellHistory")
	public String sellHistory(Principal principal, Model model) {
		return "artist/sellHistory";
	}
	
	//정산내역
	@RequestMapping("artist/settleHistory")
	public String settleHistory(Principal principal, Model model) {
		return "artist/settleHistory";
	}
}
