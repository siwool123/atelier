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
import org.springframework.security.access.method.P;
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
import jakarta.servlet.http.Part;
import utils.BoardPage;
import utils.MyFunctions;
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
		
        int midx = dao2.mview(principal.getName()).getMidx();
        List<PointDTO> polist = dao2.pointlist(midx);
        
        int psum = 0, msum=0;
        for(PointDTO podto : polist) {
        	psum += podto.getAdd_point();
        	msum += podto.getMinus_point();
        }
        int total = psum-msum;
        int result = dao2.mpoint(total);
        System.out.println(total+", 총포인트, 멤버테이블반영결과 : "+result);
        
        model.addAttribute("polist", polist);
        model.addAttribute("total", total);
        
        Map<Object, Object> map = payService.memberIndex(principal);
        model.addAttribute("map", map);
        
		return "member/point";
	}
	
	@RequestMapping("member/like")
	public String like(Principal principal, Model model, HttpServletRequest req, ParameterDTO parameterDTO, MemberDTO memberDTO) {
		System.out.println(parameterDTO);
		if(req.getParameter("sWord")!=null) {
			parameterDTO.getSWord().clear();
			for(String str : req.getParameter("sWord").split(" ")) {
				System.out.println(str); parameterDTO.getSWord().add(str);}
			}
		int ppmin = dao2.minprice();
		int ppmax = dao2.maxprice();
		System.out.println(parameterDTO);
		int totalCount = dao2.totalLikeCount(dao.mview(principal.getName()).getMidx());
		//페이징을 위한 설정값(하드코딩)
		//int pageSize = 3;//한 페이지당 게시물 수
		//int blockPage = 10;//한 블럭당 페이지 번호 수
		/* 목록에 첫 진입시에는 페이지 번호가 없으므로 무조건 1로 설정하고, 파라미터로 전달된 페이지 번호가 있다면 받은 후 정수로 변경해서 설정한다. */
		//int pageNum = (req.getParameter("pageNum")==null || req.getParameter("pageNum").equals(""))? 1 : Integer.parseInt(req.getParameter("pageNum"));
		
		//int start = (pageNum-1) * pageSize + 1; //현재 페이지에 출력한 게시물의 구간을 계산한다.
		//int end = pageNum * pageSize;
		//parameterDTO.setStart(start); //계산된 값은 DTO에 저장한다.
		//parameterDTO.setEnd(end);
		parameterDTO.setMidx(dao.mview(principal.getName()).getMidx());//회원 midx 저장
		
		List<ProductDTO> plist1 = dao2.selectLikeProduct(parameterDTO); //데이터베이스에서 인출한 좋아요 게시물의 목록을 Model객체에 저장한다.
		
		model.addAttribute("plist", plist1);
		System.out.println(parameterDTO);
		//게시판 하단에 출력한 페이지번호를 String으로 반환받은 후 Model 객체에 저장한다.
		//String pagingImg = BoardPage.pagingImg(totalCount, pageSize, blockPage, pageNum, req.getContextPath());
		//model.addAttribute("pagingImg", pagingImg);
		//model.addAttribute("totalCount", totalCount);
		//model.addAttribute("minPrice", ppmin);
		//model.addAttribute("maxPrice", ppmax);
		
		Map<Object, Object> map = payService.memberIndex(principal);
        model.addAttribute("map", map);
        
        return "member/like";
	}
	
	@PostMapping("member/editPlace.do")
	public String editPlaceProcess(Principal principal, HttpServletRequest req, MemberDTO memberDTO) {
		String savedFileName;
		try {
			String uploadDir = ResourceUtils.getFile("classpath:static/uploads/").toPath().toString();
			System.out.println("물리적 경로 : "+uploadDir);
			
			if (dao.mview(principal.getName()) != null) {
				memberDTO = dao.mview(principal.getName());
				File file = new File( uploadDir + File.separator + memberDTO.getPlaces() );
				if(file.exists()) file.delete();
			}
			
			Part part = req.getPart("placeImage");
			String partHeader = part.getHeader("content-disposition");
			System.out.println("partHeader="+partHeader);
			String[] phArr = partHeader.split("filename=");
			savedFileName = phArr[1].trim().replace("\"","");
			savedFileName = MyFunctions.renameFile(uploadDir, savedFileName);
			if(!savedFileName.isEmpty()) {
				part.write(uploadDir+File.separator+savedFileName);
			}

			System.out.println("파일 업로드 성공 / 저장된 파일 이름 : "+savedFileName);
			
			memberDTO.setId(principal.getName());
			memberDTO.setPlaces(savedFileName);
			System.out.println(memberDTO);
			if(dao.mplupdate(memberDTO) == 1) {
				System.out.println("회원정보-profiles 수정 성공");
			} else {
				System.out.println("회원정보-profiles 수정 실패");
			}
			
			return "redirect:/member/like";
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("업로드 실패");
			return "redirect:/member/like";
		}
	}
	
	@PostMapping("member/deleteLike")
	public String deleteLike() {
		
		return "member/like";
	}
	
	
}



