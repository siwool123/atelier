package com.edu.springboot;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.edu.springboot.restboard.ProductDTO;
import com.edu.springboot.restboard.ReviewDTO;
import com.edu.springboot.restboard.ParameterDTO;
import com.edu.springboot.restboard.ArtistDTO;
import com.edu.springboot.restboard.CartDTO;
import com.edu.springboot.restboard.IBoardService;
import com.edu.springboot.restboard.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import utils.BoardPage;
import utils.SecurityUtils;

@Controller
public class MainController {

	@Autowired
	IBoardService dao;

	/* 커스텀로그인페이지매핑. 스프링시큐리티는 세션사용해서 로그인정보저장하지만 
	 * 개발자가 직접 접근할수없으므로, Principal 객체통해 로그인아이디를 얻어올수있다 */
	@RequestMapping("/login")
	public String login1(Principal principal, Model model, HttpServletRequest req) {
		
		try {
			String user_id = principal.getName(); //로그인아이디 얻어온다.
			model.addAttribute("user_id", user_id); //아이디를 모델객체에 저장
			if(user_id!=null) return "home";
			System.out.println("로그인에 성공했습니다.");
		}catch (Exception e){
			/* 최초접근시엔 로그인정보가 없으므로 널포인터 예외 발생하므로 예외처리해야한다. */
			System.out.println("로그인 전입니다.");
		} 
		return "auth/login";
	}
	
	//로그인시도중에러발생한경우 
//	@RequestMapping("/error")
//	public String login2() {
//		return "auth/error";
//	}
	//로그인성공했으나 권한부족한경우
	@RequestMapping("/denied")
	public String login3() {
		return "auth/denied";
	}
	
	@RequestMapping(value={"/", "/shop"})
	public String home(Model model, HttpServletRequest req, ParameterDTO parameterDTO) {
		
		if(req.getParameter("sWord")!=null) {
			parameterDTO.getSWord().clear();
			for(String str : req.getParameter("sWord").split(" ")) {
				System.out.println(str); parameterDTO.getSWord().add(str);}
		}
		
		int ppmin = dao.minprice();
		int ppmax = dao.maxprice();
		
		int totalCount = dao.totalCount(parameterDTO);
		//페이징을 위한 설정값(하드코딩)
		int pageSize = 9;//한 페이지당 게시물 수
		int blockPage = 10;//한 블럭당 페이지 번호 수
		/* 목록에 첫 진입시에는 페이지 번호가 없으므로 무조건 1로 설정하고, 파라미터로 전달된 페이지 번호가 있다면 받은 후 정수로 변경해서 설정한다. */
		int pageNum = (req.getParameter("pageNum")==null || req.getParameter("pageNum").equals(""))? 1 : Integer.parseInt(req.getParameter("pageNum"));
		
		int start = (pageNum-1) * pageSize + 1; //현재 페이지에 출력한 게시물의 구간을 계산한다.
		int end = pageNum * pageSize;
		parameterDTO.setStart(start); //계산된 값은 DTO에 저장한다.
		parameterDTO.setEnd(end);
		List<ProductDTO> plist1 = dao.selectProduct(parameterDTO); //데이터베이스에서 인출한 게시물의 목록을 Model객체에 저장한다.
		model.addAttribute("plist", plist1);
		
		//게시판 하단에 출력한 페이지번호를 String으로 반환받은 후 Model 객체에 저장한다.
		String pagingImg = BoardPage.pagingImg(totalCount, pageSize, blockPage, pageNum, req.getContextPath());
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("minPrice", ppmin);
		model.addAttribute("maxPrice", ppmax);
		return "home";
	}
	
	@RequestMapping(value={"/view", "/member/view"})
	public String view (@RequestParam int pidx, Model model, Principal principal, ParameterDTO parameterDTO) {
		
		String user_id = null;
		if(principal != null) {user_id = principal.getName();}
		System.out.println(user_id);
		
		ProductDTO productDTO = dao.pview(pidx);
		if(productDTO == null) {return "error";}
		int aidx = productDTO.getAidx();
		ArtistDTO artistDTO = dao.aview(aidx);
		
		productDTO.setP_like(dao.plikecount(pidx));
		productDTO.setP_intro(productDTO.getP_intro().replaceAll("\n", "<br/>"));
		artistDTO.setA_history(artistDTO.getA_history().replaceAll("\n", "<br/>"));
		artistDTO.setA_intro(artistDTO.getA_intro().replaceAll("\n", "<br/>"));
		
		parameterDTO.setAidx(aidx);
		List<ProductDTO> aplist = dao.selectbya(aidx);
		ReviewDTO reviewDTO = dao.rview(pidx);
		
		model.addAttribute("pdto", productDTO);
		model.addAttribute("adto", artistDTO);
		model.addAttribute("rdto", reviewDTO);
		model.addAttribute("aplist", aplist);
		model.addAttribute("user_id", user_id);
		
		return "view";
	}
	
	@RequestMapping("/vartist")
	public String view (@RequestParam int aidx, Model model, ParameterDTO parameterDTO, HttpServletRequest req) {
		
		int pageSize = 8;//한 페이지당 게시물 수
		int blockPage = 20;//한 블럭당 페이지 번호 수
		int pageNum = (req.getParameter("pageNum")==null || req.getParameter("pageNum").equals(""))? 1 : Integer.parseInt(req.getParameter("pageNum"));
		
		int start = (pageNum-1) * pageSize + 1; //현재 페이지에 출력한 게시물의 구간을 계산한다.
		int end = pageNum * pageSize;
		parameterDTO.setStart(start); //계산된 값은 DTO에 저장한다.
		parameterDTO.setEnd(end);
		parameterDTO.setAidx(aidx);
		
		ArtistDTO artistDTO = dao.aview(aidx);
		artistDTO.setA_history(artistDTO.getA_history().replaceAll("\n", "<br/>"));
		artistDTO.setA_intro(artistDTO.getA_intro().replaceAll("\n", "<br/>"));
		
		List<ProductDTO> aplist = dao.selectbya(aidx);
		
		List<ReviewDTO> rlist = dao.rvlistbya(parameterDTO);
		int rstarsum = 0, staravg = 0;
		for(ReviewDTO rdto:rlist) {rstarsum += rdto.getStar();}
		if(rlist.size()!=0) {staravg = rstarsum/rlist.size();}
		model.addAttribute("staravg", staravg);
		
		int soldsum = 0, likesum = 0;
		for(ProductDTO pdto:aplist) {
			if(pdto.getSold()==1) {soldsum++;}
			likesum += pdto.getP_like();
		}
		
		parameterDTO.setSold(0);
		List<ProductDTO> plist0 = dao.productsbyas(parameterDTO);
		model.addAttribute("plist0", plist0);
		
		parameterDTO.setSold(1);
		List<ProductDTO> plist1 = dao.productsbyas(parameterDTO);
		model.addAttribute("plist1", plist1);
		
		String pagingImg0 = BoardPage.pagingImg2(aplist.size()-soldsum, pageSize, blockPage, pageNum);
		String pagingImg1 = BoardPage.pagingImg2(soldsum, pageSize, blockPage, pageNum);
		String pagingImgr = BoardPage.pagingImg(rlist.size(), pageSize, blockPage, pageNum, req.getContextPath());
		
		model.addAttribute("pagingImg0", pagingImg0);
		model.addAttribute("pagingImg1", pagingImg1);
		model.addAttribute("pagingImgr", pagingImgr);
		
		model.addAttribute("adto", artistDTO);
		model.addAttribute("aplist", aplist);
		model.addAttribute("rlist", rlist);
		
		model.addAttribute("soldsum", soldsum);
		model.addAttribute("likesum", likesum);
		
		return "viewartist";
	}
	
	@RequestMapping("/auction")
	public String auction (Model model, HttpServletRequest req, ParameterDTO parameterDTO) {
		
		if(req.getParameter("sWord")!=null) {
			parameterDTO.getSWord().clear();
			for(String str : req.getParameter("sWord").split(" ")) {
				System.out.println(str); parameterDTO.getSWord().add(str);}
		}
		
		int ppmin = dao.minprice();
		int ppmax = dao.maxprice();
		
		int totalCount = dao.totalCount(parameterDTO);
		//페이징을 위한 설정값(하드코딩)
		int pageSize = 9;//한 페이지당 게시물 수
		int blockPage = 10;//한 블럭당 페이지 번호 수
		/* 목록에 첫 진입시에는 페이지 번호가 없으므로 무조건 1로 설정하고, 파라미터로 전달된 페이지 번호가 있다면 받은 후 정수로 변경해서 설정한다. */
		int pageNum = (req.getParameter("pageNum")==null || req.getParameter("pageNum").equals(""))? 1 : Integer.parseInt(req.getParameter("pageNum"));
		
		int start = (pageNum-1) * pageSize + 1; //현재 페이지에 출력한 게시물의 구간을 계산한다.
		int end = pageNum * pageSize;
		parameterDTO.setStart(start); //계산된 값은 DTO에 저장한다.
		parameterDTO.setEnd(end);
		List<ProductDTO> auclist = dao.selectAuction(parameterDTO); //데이터베이스에서 인출한 게시물의 목록을 Model객체에 저장한다.
		model.addAttribute("auclist", auclist);
		
		//게시판 하단에 출력한 페이지번호를 String으로 반환받은 후 Model 객체에 저장한다.
		String pagingImg = BoardPage.pagingImg(totalCount, pageSize, blockPage, pageNum, req.getContextPath());
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("totalCount", auclist.size());
		model.addAttribute("minPrice", ppmin);
		model.addAttribute("maxPrice", ppmax);
		return "auction";
	}
	
	@RequestMapping("admin/test")
	String testPage() {
		return "testPage";
	}
	
}
