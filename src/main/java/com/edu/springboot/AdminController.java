package com.edu.springboot;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.restboard.IAdminService;
import com.edu.springboot.restboard.MemberDTO;
import com.edu.springboot.restboard.ParameterDTO;

import jakarta.servlet.http.HttpServletRequest;
import utils.BoardPage;

@Controller
public class AdminController {
	
	//서비스 자동주입
	@Autowired
	IAdminService dao;

	//관리자 로그인 페이지
	@RequestMapping("/admin")
	public String admin() {		
		return "admin/admin";
	}
	
	//임시제작
	@RequestMapping("/admin/noticewrite")
	public String noticewrite() {		
		return "admin/adminNoticeWrite";
	}
	
	//회원관리 목록
	@RequestMapping("/admin/member")
	public String adminMember(Model model, HttpServletRequest req, ParameterDTO parameterDTO) {
		
		int totalCount = dao.adminTotalCount(parameterDTO);
		int pageSize = 1000;
		int blockPage = 5;		
		int pageNum = (req.getParameter("pageNum")==null || req.getParameter("pageNum").equals("")) 
			? 1 : Integer.parseInt(req.getParameter("pageNum"));
		int start = (pageNum-1) * pageSize + 1;
		int end = pageNum * pageSize;
		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);
		
		Map<String, Object> maps = new HashMap<String, Object>();
		maps.put("totalCount", totalCount);
		maps.put("pageSize", pageSize);
		maps.put("pageNum", pageNum);
		model.addAttribute("maps", maps);
		
		ArrayList<MemberDTO> lists = dao.adminList(parameterDTO);
		model.addAttribute("lists", lists);
		
		//게시판 하단에 출력한 페이지번호를 String으로 반환받은 후 Model객체에 저장한다.
		String pagingImg = BoardPage.pagingImg(totalCount, pageSize, blockPage, pageNum,
				req.getContextPath()+"/list.do?");
		model.addAttribute("pagingImg", pagingImg);
		
		return "admin/adminMember";
	}
	
	//강제탈퇴
	@PostMapping("/admin/memberLeave")
	public String memberLeave(Model model, ParameterDTO parameterDTO) {
		int result = dao.memberLeave(parameterDTO);
		if(result==1) 
			System.out.println("업데이트 성공");
		else 
			System.out.println("업데이트 실패");
		return "redirect:/admin/member";
	}		
	
	//영구삭제
	@PostMapping("/admin/memberDelete")
	public String memberDelete(Model model, HttpServletRequest req, ParameterDTO parameterDTO) {
		String returnPage = "redirect:/admin/member";
		try {
			int result = dao.memberDelete(parameterDTO);
			if(result==1) 
				System.out.println("삭제 성공");
			else 
				System.out.println("삭제 실패");
		}
		catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "자식 데이터가 있어 삭제할 수 없습니다. <a href='/admin/member' style='color:red;'>[회원관리 바로가기]</a>");
			returnPage = "admin/adminMember";
		}
		
		return returnPage;
	}
	

	
	
	
	
	
	
}
