package com.edu.springboot;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/guest/index")
	public String welcome1() {
		return "guest";
	}
	
	@RequestMapping("/member/index")
	public String welcome2() {
		return "member";
	}
	
	@RequestMapping("/admin/index")
	public String welcome3() {
		return "admin";
	}
	
	/* 커스텀로그인페이지매핑. 스프링시큐리티는 세션사용해서 로그인정보저장하지만
	/* 개발자가 직접 접근할수없으므로, Principal 객체통해 로그인아이디를 얻어올수있다 */
	@RequestMapping("/login")
	public String login1(Principal principal, Model model) {
		try {
			String user_id = principal.getName(); //로그인아이디 얻어온다.
			model.addAttribute("user_id", user_id); //아이디를 모델객체에 저장
		}catch (Exception e){
			/* 최초접근시엔 로그인정보가 없으므로 널포인터 예외 발생하므로 예외처리해야한다. */
			System.out.println("로그인 전입니다.");
		}return "auth/login";
	}
	
	//로그인시도중에러발생한경우
	@RequestMapping("/error.do")
	public String login2() {
		return "auth/error";
	}
	//로그인성공했으나 권한부족한경우
	@RequestMapping("/denied")
	public String login3() {
		return "auth/denied";
	}
}
