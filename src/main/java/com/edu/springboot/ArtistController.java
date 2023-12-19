package com.edu.springboot;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.pay.PayService;
import com.edu.springboot.restboard.ArtistDTO;
import com.edu.springboot.restboard.IArtistService;
import com.edu.springboot.restboard.IBoardService;
import com.edu.springboot.restboard.IMemberService;
import com.edu.springboot.restboard.MemberDTO;
import com.edu.springboot.restboard.ProductDTO;

@Controller
public class ArtistController {

	@Autowired
	IMemberService dao;
	
	@Autowired
	IBoardService dao2;
	
	@Autowired
	PayService payService;
	
	@Autowired
	IArtistService ardao;

	//작가프로필
	@RequestMapping("artist/profile")
	public String artistProfile(Principal principal, Model model) {

		Map<Object, Object> map = payService.memberIndex(principal);
        model.addAttribute("map", map);
        
        try {
        String id = principal.getName();
        MemberDTO memberDTO = dao.mview(id);
        int midx = memberDTO.getMidx();
        
        ArtistDTO artistDTO = ardao.aview(midx);
        
        List<ProductDTO> aplist = ardao.aplist(midx);
        
        model.addAttribute("mdto", memberDTO);
        model.addAttribute("adto", artistDTO);
        model.addAttribute("aplist", aplist);
        model.addAttribute("soldsum", ardao.solselect(artistDTO.getAidx()));
        model.addAttribute("likesum", ardao.likesum(artistDTO.getAidx()));
        }catch(Exception e) {
        	e.printStackTrace();
        	System.out.println("작가정보조회실패");
        }
		return "artist/profile";
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
