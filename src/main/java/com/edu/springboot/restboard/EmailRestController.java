package com.edu.springboot.restboard;

import java.io.File;
import java.security.Principal;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import utils.MyFunctions;

@RestController
public class EmailRestController {

	@Autowired
	IMemberService dao;
	
	@Autowired
	EmailSending email;
	
	//이메일 중복 검사	
	@PostMapping("/rest/emailOverlap")
	public int emailcheck (@RequestParam String id) {
		int result = 0;
		MemberDTO memberDTO = dao.mview(id);
		if(memberDTO!=null) {result = 1;}
		else result = -1;
		return result;
	}
	 
	//비밀번호 찾기 이메일 인증 번호 발송   
	@PostMapping("/rest/findPass") 
	public HashMap<String, String> findPass (HttpServletRequest req, HttpSession session, Model model, InfoDTO infoDTO) {
		System.out.println("인증번호요청도착"+req.getParameter("id"));
		HashMap<String, String> findPassMap = new HashMap<String, String>();
		
		MemberDTO memberDTO = dao.mview(req.getParameter("id"));
		if (memberDTO == null) { System.out.println("아이디 입력 안하거나 가입한 회원이 아닙니다.");
			return findPassMap;
		} else { System.out.println("아이디 조회 성공");
		
			email.findPassEmailSender(infoDTO, memberDTO); //아이디가 존재할 경우 이메일을 발송한다.
			findPassMap.put("findPassIdSuc", "1"); //맵 suc 키에 1을 담는다.
			session.setAttribute("findPassNum", infoDTO.getFindPassNum()); //세션 영역에 인증번호를 저장한다.
		} 
		return findPassMap;
	}
	
	//비밀번호 찾기 인증번호 확인하기
	@PostMapping("/rest/findPassCheck")
	public HashMap<String,String> findPassCheck(MemberDTO memberDTO, InfoDTO infoDTO, HttpSession session, Model model) {
		HashMap<String, String> findPassCheckMap = new HashMap<String, String>();
		try {
			if(infoDTO.getFindPassNum()=="") {
				System.out.println("인증번호 입력 안함");
				findPassCheckMap.put("findPassCheckSuc", "-2");
				return findPassCheckMap;
			} else if(session.getAttribute("findPassNum")==null) {
				System.out.println("인증번호 발송 안함");
				findPassCheckMap.put("findPassCheckSuc", "-1");
				return findPassCheckMap;
			} else if (Integer.parseInt(infoDTO.getFindPassNum().toString()) == Integer.parseInt(session.getAttribute("findPassNum").toString())) {
				System.out.println("인증번호 일치");
				
				MemberDTO findPassCheckDaoResult = dao.mview(memberDTO.getId());
				
				findPassCheckMap.put("m_name", findPassCheckDaoResult.getM_name());
				findPassCheckMap.put("pass", findPassCheckDaoResult.getPass());
				findPassCheckMap.put("findPassCheckSuc", "1");
				
				//세션에 저장되어있던 인증번호를 지운다.
				session.removeAttribute("findPassIdSuc");
				System.out.println("인증번호 삭제. session findPassNum : "+session.getAttribute("findPassIdSuc"));
				
				return findPassCheckMap;
			} else {
				System.out.println("인증번호 불일치");
				System.out.println("infoDTOpassnum : "+infoDTO.getFindPassNum());
				System.out.println("session pass Num : "+session.getAttribute("findPassNum"));
				findPassCheckMap.put("findPassCheckSuc", "0");
				return findPassCheckMap;
			} 
		} catch (Exception e) {
			System.out.println("인증번호에 문자를 입력함");
			findPassCheckMap.put("findPassCheckSuc", "-3");
			return findPassCheckMap;
		}
	}
	
	@PostMapping("/member/uploadProfile")
	public int uploadProfileProcess(HttpServletRequest req, Model model, Principal principal) {
		int result = 0;
		try {
			String uploadDir = ResourceUtils.getFile("classpath:static/uploads/").toPath().toString();
			System.out.println("물리적 경로 : "+uploadDir);
			
			Part part = req.getPart("profileo");
			String partHeader = part.getHeader("content-disposition");
			System.out.println("partHeader="+partHeader);
			String[] phArr = partHeader.split("filename=");
			String oFileName = phArr[1].trim().replace("\"","");
			
			if(!oFileName.isEmpty()) { part.write(uploadDir+File.separator+oFileName); }
			String sFileName = MyFunctions.renameFile(uploadDir, oFileName);
			
			String user_id = principal.getName(); 
			MemberDTO memberDTO = dao.mview(user_id);
			memberDTO.setProfiles(sFileName);
			memberDTO.setId(user_id);
			result = dao.uploadProfile(memberDTO);
			
		}
		catch (Exception e) { System.out.println("업로드 실패"); }
		
		return result;
	}
}
