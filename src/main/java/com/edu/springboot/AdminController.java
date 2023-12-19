package com.edu.springboot;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.springboot.restboard.ApplyDTO;
import com.edu.springboot.restboard.ArtistDTO;
import com.edu.springboot.restboard.EmailSending;
import com.edu.springboot.restboard.IAdminService;
import com.edu.springboot.restboard.IBoardService;
import com.edu.springboot.restboard.MemberDTO;
import com.edu.springboot.restboard.ParameterDTO;
import com.edu.springboot.restboard.ProductDTO;
import com.edu.springboot.restboard.ReviewDTO;

import jakarta.servlet.http.HttpServletRequest;
import utils.BoardPage;

@Controller
public class AdminController {
	
	//서비스 자동주입
	@Autowired
	IAdminService dao;
	
	@Autowired
	IBoardService dao2;
	
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
	
	//아티스트 신청 관리 목록
	@RequestMapping("/admin/artistApply")
	public String adminArtist(Model model, HttpServletRequest req, ParameterDTO parameterDTO) {
		
		int totalCount = dao.artistTotalCount(parameterDTO);
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
		
		ArrayList<ApplyDTO> lists = dao.artistList(parameterDTO);
		model.addAttribute("lists", lists);
		
		//게시판 하단에 출력한 페이지번호를 String으로 반환받은 후 Model객체에 저장한다.
		String pagingImg = BoardPage.pagingImg(totalCount, pageSize, blockPage, pageNum,
				req.getContextPath()+"/list.do?");
		model.addAttribute("pagingImg", pagingImg);
		
		return "admin/artistApply";
	}
	
	//아티스트 신청 관리 상세보기
	@RequestMapping("/admin/artistApplyView")
	public String adminArtistView(Model model, ParameterDTO parameterDTO) {
		
		model.addAttribute("row", dao.artistView(parameterDTO));
		return "admin/artistApplyView";
	}
		
	//아티스트 관리 목록
	@RequestMapping("/admin/artist")
	public String artistMember(Model model, HttpServletRequest req) {
		
		List<ArtistDTO> alist = dao.alist2();
		for(ArtistDTO adto : alist) {
			if(adto.getA_history().length()>100) {adto.setA_history(adto.getA_history().substring(0,100)+"...");}
			if(adto.getA_intro().length()>100) {adto.setA_intro(adto.getA_intro().substring(0,100)+"...");}
		}
		model.addAttribute("alist", alist);
		
		return "admin/artistMember";
	}
	
	//아티스트 상세보기
	@RequestMapping("/admin/artistView")
	public String artistView(Model model, HttpServletRequest req, @RequestParam int aidx, ParameterDTO parameterDTO) {
		int rstarsum = 0, staravg = 0;
		try {
			ArtistDTO adto = dao2.aview(aidx);
			System.out.println("adto : "+adto);
			
			try{
				List<ReviewDTO> rlist = dao2.rvlistbya2(aidx);
				if(rlist!=null && rlist.size()!=0) {
					for(ReviewDTO rdto:rlist) { rstarsum += rdto.getStar(); }
					staravg = (int)rstarsum/rlist.size();
					System.out.println("리뷰갯수 : "+staravg);
				}
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("리뷰없음");
			}
			parameterDTO.setAidx(aidx);
			parameterDTO.setAuction(0);
			List<ProductDTO> naplist = dao2.productsbyas2(parameterDTO);
			parameterDTO.setAuction(1);
			List<ProductDTO> aplist = dao2.productsbyas2(parameterDTO);
			System.out.println("naplist: "+naplist.size()+", aplist : "+aplist.size());
			
			model.addAttribute("staravg", staravg);
			model.addAttribute("naplist", naplist);
			model.addAttribute("aplist", aplist);
			model.addAttribute("adto", adto);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("작가정보가져오기실패");
		}
		
		return "admin/artistView";
	}
	
	//판매작품관리
	@RequestMapping("/admin/saleproduct")
	public String saleproduct(Model model, HttpServletRequest req, ParameterDTO parameterDTO) {
		parameterDTO.setAuction(0);
		List<ProductDTO> salelist = dao2.selProduct(parameterDTO);
		model.addAttribute("salelist", salelist);
		return "admin/saleproduct";
	}
	
	//경매작품관리
	@RequestMapping("/admin/aucproduct")
	public String aucproduct(Model model, HttpServletRequest req, ParameterDTO parameterDTO) {
		parameterDTO.setAuction(1);
		List<ProductDTO> auclist = dao2.selProduct(parameterDTO);
		model.addAttribute("auclist", auclist);
		return "admin/aucproduct";
	}
}
