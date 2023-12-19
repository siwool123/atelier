package com.edu.springboot.restboard;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ArtistRestController {
	
	@Autowired
	IMemberService dao;
	
	@Autowired
	IArtistService ardao;
	
	//작가소개 수정
	@PostMapping("artist/editIntro.do")
	int editIntroProcess(Principal principal, Model model, ArtistDTO artistDTO) {
		int editResult;
		String id = principal.getName();
		MemberDTO mdto = dao.mview(id);
		ArtistDTO adto = ardao.aview(mdto.getMidx());
		adto.setA_intro(artistDTO.getA_intro());
		editResult = ardao.aintroupdate(adto);
		return editResult;
	}
	
	//작가이력 수정
	@PostMapping("artist/editHistory.do")
	int editHistoryProcess(Principal principal, Model model, ArtistDTO artistDTO) {
		int editResult;
		String id = principal.getName();
		MemberDTO mdto = dao.mview(id);
		ArtistDTO adto = ardao.aview(mdto.getMidx());
		adto.setA_history(artistDTO.getA_history());
		editResult = ardao.ahistoryupdate(adto);
		return editResult;
	}
}
