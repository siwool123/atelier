package com.edu.springboot;

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
import com.edu.springboot.restboard.ArtistDTO;
import com.edu.springboot.restboard.CartDTO;
import com.edu.springboot.restboard.IBoardService;
import com.edu.springboot.restboard.IMemberService;
import com.edu.springboot.restboard.MemberDTO;
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
	
	@RequestMapping("member/edit")
	   public String edit(Principal principal, Model model, MemberDTO memberDTO) {
	      try {
	         String user_id = principal.getName(); //로그인아이디 얻어온다.
	         memberDTO = dao.mview(user_id);
	         model.addAttribute("mdto", memberDTO);
	         System.out.println(memberDTO);
	      }catch (Exception e){
	         System.out.println("정보수정 페이지 접속 실패");
	      }
	      return "member/editMember";
	   }
	   
   @RequestMapping("member/editWindow")
   public String editWinddow(Principal principal,Model model, MemberDTO memberDTO) {
      String user_id = principal.getName(); //로그인아이디 얻어온다.
      memberDTO = dao.mview(user_id);
      model.addAttribute("mdto", memberDTO);
      System.out.println(memberDTO);
      return "member/editWindow";
   }
	
	@PostMapping("member/edit.do")
	String editProcess(Principal principal, MemberDTO memberDTO, Model model) {
		memberDTO.setId(principal.getName());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(memberDTO.getPass());
		System.out.println(securePw);
		memberDTO.setPass(securePw); //암호화하여 저장
		System.out.println("new memberDTO : "+ memberDTO);
		if(dao.mupdate(memberDTO) == 1) {
			System.out.println("회원정보수정 성공");
		} else {
			System.out.println("회원정보수정 실패");
		}
		return "member/editMember";
	}
	
}