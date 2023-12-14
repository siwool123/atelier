package com.edu.springboot;

import java.io.File;
import java.security.Principal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.eclipse.jdt.internal.compiler.codegen.ExceptionLabel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.springboot.restboard.ProductDTO;
import com.edu.springboot.restboard.ReviewDTO;
import com.edu.springboot.restboard.ParameterDTO;
import com.edu.springboot.restboard.PointDTO;
import com.edu.springboot.pay.PayService;
import com.edu.springboot.restboard.ApplyDTO;
import com.edu.springboot.restboard.ArtistDTO;
import com.edu.springboot.restboard.CartDTO;
import com.edu.springboot.restboard.IBoardService;
import com.edu.springboot.restboard.IMemberService;
import com.edu.springboot.restboard.MemberDTO;
import com.edu.springboot.restboard.OPjoinDTO;
import com.edu.springboot.restboard.Order2DTO;
import com.edu.springboot.restboard.OrderDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import utils.BoardPage;
import utils.SecurityUtils;

@Controller
public class MemberController {

	@Autowired
	IMemberService dao;
	
	@Autowired
	IBoardService dao2;
	
	@Autowired
	PayService payService;
	
	@RequestMapping("/member/index")
	public String mindex (Principal principal, Model model) {

		Map<Object, Object> map = payService.memberIndex(principal);
        model.addAttribute("map", map);
		return "member/index";
	}
	
	@RequestMapping("member/edit")
	public String edit(Principal principal, Model model, MemberDTO memberDTO) {
		
		Map<Object, Object> map = payService.memberIndex(principal);
        model.addAttribute("map", map);
        
		return "member/editMember";
	}
	
	@RequestMapping("/member/editWindow")
	public String editWinddow() {
		return "member/editWindow";
	}
	
	@PostMapping("/member/edit.do")
	public String editProcess(Principal principal, MemberDTO memberDTO, Model model, HttpServletRequest req) {
		memberDTO.setId(principal.getName());
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(memberDTO.getPass());
		System.out.println(securePw);
		memberDTO.setPass(securePw); //암호화하여 저장
		System.out.println("new memberDTO : "+ memberDTO);
		if(dao.mupdate(memberDTO) == 1) { System.out.println("회원정보수정 성공");
		} else { System.out.println("회원정보수정 실패"); 	}
		return "redirect:/member/edit";
	}
	

	@RequestMapping("/member/leave.do")
	public String leaveProcess(Principal principal) {
		int leaveResult = dao.leave(principal.getName());
		if (leaveResult == 1) { System.out.println("회원탈퇴 성공(비활성화)");
		} else { System.out.println("회원탈퇴 실패"); }
		return "redirect:/logout";
	}
	
	@RequestMapping("/member/point")
	public String point(Principal principal, Model model) {
		
		Map<Object, Object> map = payService.memberIndex(principal);
        model.addAttribute("map", map);
        
        int midx = dao.mview(principal.getName()).getMidx();
        
        
		return "member/point";
	}
	
}



