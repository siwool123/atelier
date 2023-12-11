package com.edu.springboot;

import java.io.File;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.restboard.EmailSending;
import com.edu.springboot.restboard.IMemberService;
import com.edu.springboot.restboard.InfoDTO;
import com.edu.springboot.restboard.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import utils.MyFunctions;

@Controller
public class EmailController {
	
	@Autowired
	EmailSending email;

	@Autowired
	IMemberService dao;
	
	@RequestMapping("/guest/signup")
	public String signup(Model model) {
		model.addAttribute("loginPage","2");
		return "member/signup";
	}

	@RequestMapping("/guest/emailCheck")
	public String emailCheck() {
		return "member/emailCheck";
	}

	//이메일 인증 번호 발송
	@PostMapping("/guest/emailSend")
	public String emailSendProcess(InfoDTO infoDTO, MemberDTO memberDTO, Model model) {
		
		email.myEmailSender(infoDTO, memberDTO);
		model.addAttribute("id", memberDTO.getId());
		model.addAttribute("content", infoDTO.getContent());
		
		return "member/emailCheck";
	}
	
	//발송된 이메일 인증번호와 입력 받은 번호 일치 여부 확인
	@PostMapping("/guest/checknum")
	public String emailSendProcess1(InfoDTO infoDTO, Model model, MemberDTO memberDTO, HttpServletRequest req) {
		int authsuccess = 0;
		
		model.addAttribute("id", memberDTO.getId());
		model.addAttribute("content", infoDTO.getContent());
		model.addAttribute("userContent", req.getParameter("userContent"));
		
		//infoDTO는 model에 저장안하면 없어지고, 저장하면 infoDTO, model 둘 다 남는데, req는 model에 저장 안하면 날아가고, 저장해도 model에만 남는다.

		try {
			int checkmodelContent = Integer.parseInt((model.getAttribute("content")).toString());
		}catch (Exception e) {
			System.out.println("인증번호 발송 안됨");
			authsuccess = -1;
			e.printStackTrace();
		}
		
		try {
			int checkuserContent = Integer.parseInt(model.getAttribute("userContent").toString());
		} catch (NumberFormatException e) {
			System.out.println("인증번호 입력안함");
			authsuccess = -2;
			System.out.println("numberformatexception");
		}
		
		if (Integer.parseInt((model.getAttribute("userContent")).toString()) == Integer.parseInt((infoDTO.getContent()).toString())) {
			System.out.println("인증성공");
			authsuccess = 1;

		} else {
			System.out.println("인증실패");
			authsuccess = 0;
		}
		
		model.addAttribute("dto", memberDTO);
		model.addAttribute("authsuccess", authsuccess);
		return "member/emailCheck";
	}

	@Autowired
	SmsController sms;

	@RequestMapping("/guest/smsCheck")
	public String SmsCheck() {
		return "member/smsCheck";
	}
	
	// 휴대폰 인증번호 발송
	@PostMapping("/guest/smsauth")
	public String SmsAuth(MemberDTO memberDTO, InfoDTO infoDTO, Model model) {
		
		sms.sendOne(memberDTO, infoDTO);
		model.addAttribute("phone", memberDTO.getPhone());
		model.addAttribute("smsContent", infoDTO.getSmsContent());

		return "member/smsCheck";
	}
	
	// 발송된 번호와 입력된 번호 일치 여부 확인
	@PostMapping("/guest/smscheck")
	public String SmsCheckProcess(Model model, MemberDTO memberDTO, HttpServletRequest req, InfoDTO infoDTO) {
		int smsAuthsuccess = 0;
		
		model.addAttribute("phone", memberDTO.getPhone());
		model.addAttribute("smsContent", infoDTO.getSmsContent());
		model.addAttribute("userSmsContent",req.getParameter("userSmsContent"));
		
		try { int ckSessionSmsContent = Integer.parseInt((model.getAttribute("smsContent")).toString());
		}catch (Exception e) {
			System.out.println("인증번호 발송 안됨");
			e.printStackTrace();
			smsAuthsuccess = -1;
		}
		
		try { int ckUserSmsContent = Integer.parseInt(model.getAttribute("userSmsContent").toString());
		} catch (Exception e) {
			System.out.println("인증번호 입력 안됨");
			e.printStackTrace();
			smsAuthsuccess = -2;
		}
		
		if (Integer.parseInt((model.getAttribute("smsContent")).toString()) == Integer.parseInt(model.getAttribute("userSmsContent").toString())) {
			System.out.println("인증성공");
			smsAuthsuccess = 1;
		} else { System.out.println("인증실패"); smsAuthsuccess = 0; }
		
		model.addAttribute("smsAuthsuccess", smsAuthsuccess);
		return "member/smsCheck";
	}
	
	//회원가입
	@PostMapping("/guest/regist")
	public String Regist(MemberDTO memberDTO, Model model) {
		int result = 0;
		System.out.println("id : "+memberDTO.getId()+"+ pass : "+memberDTO.getPass()+"+ m_name : "+memberDTO.getM_name()+"+ phone : "
		+memberDTO.getPhone()+"+ zip : "+memberDTO.getZip()+"+ addr1 : "+memberDTO.getAddr1()+"+ addr2 : "+memberDTO.getAddr2());
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(memberDTO.getPass());
		System.out.println(securePw);
		memberDTO.setPass(securePw); //암호화하여 저장
		
		result = dao.minsert(memberDTO);
		
		if (result != 1 ) {System.out.println("회원가입실패");}
		
		model.addAttribute("result", result);
		return "member/signup";
	}
	
	//임시비번받기
	@RequestMapping("/guest/resetPass")
	public String findPass() {
		return "member/findPass";
	}
	
	@GetMapping("/member/uploadProfile")
	public String uploadProfile() {
		return "member/uploadProfile";
	}
	
}
