package com.edu.springboot;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.restboard.ApplyDTO;
import com.edu.springboot.restboard.ArtistDTO;
import com.edu.springboot.restboard.IMemberService;
import com.edu.springboot.restboard.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ApplyController {

	@Autowired
	IMemberService dao;
	
	@PostMapping("apply")
	String apply(Principal principal, Model model, MemberDTO memberDTO, ApplyDTO applyDTO) {
		try {
			String user_id = principal.getName(); //로그인아이디 얻어온다.
			memberDTO = dao.mview(user_id);
			model.addAttribute("mdto", memberDTO);
			System.out.println(memberDTO);
		}catch (Exception e){
			System.out.println("작가신청 페이지 접속 실패");
		}
		return "member/apply";
	}
	
	@PostMapping("apply.do")
	String applyProcess(Principal principal, HttpServletRequest req, ArtistDTO artistDTO, ApplyDTO applyDTO) {
		
		return "member/apply";
	}
	
}
