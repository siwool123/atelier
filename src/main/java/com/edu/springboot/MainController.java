package com.edu.springboot;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;

import jakarta.servlet.http.Part;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.edu.springboot.restboard.ProductDTO;
import com.edu.springboot.restboard.ReviewDTO;
import com.edu.springboot.restboard.ParameterDTO;
import com.edu.springboot.restboard.PlikeDTO;
import com.edu.springboot.restboard.ArtistDTO;
import com.edu.springboot.restboard.CartDTO;
import com.edu.springboot.restboard.IBoardService;
import com.edu.springboot.restboard.MemberDTO;

import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpServletRequest;
import utils.BoardPage;
import utils.SecurityUtils;

@Controller
public class MainController {

	@Autowired
	IBoardService dao;

	//루트경로
	@RequestMapping("/")
	public String home2 () {
		return "home";
	}
	
	@RequestMapping("/admin")
	public String admin() {
		
		return "admin/admin";
	}
	
	@RequestMapping("/admin/member")
	public String adminMember() {
		
		return "admin/adminMember";
	}
	
	@RequestMapping("/shop")
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
		int blockPage = 5;//한 블럭당 페이지 번호 수
		/* 목록에 첫 진입시에는 페이지 번호가 없으므로 무조건 1로 설정하고, 파라미터로 전달된 페이지 번호가 있다면 받은 후 정수로 변경해서 설정한다. */
		int pageNum = (req.getParameter("pageNum")==null || req.getParameter("pageNum").equals(""))? 1 : Integer.parseInt(req.getParameter("pageNum"));
		
		int start = (pageNum-1) * pageSize + 1; //현재 페이지에 출력한 게시물의 구간을 계산한다.
		int end = pageNum * pageSize;
		parameterDTO.setStart(start); //계산된 값은 DTO에 저장한다.
		parameterDTO.setEnd(end);
		List<ProductDTO> plist1 = dao.selectProduct(parameterDTO); //데이터베이스에서 인출한 게시물의 목록을 Model객체에 저장한다.
		model.addAttribute("plist", plist1);
		
		//게시판 하단에 출력한 페이지번호를 String으로 반환받은 후 Model 객체에 저장한다.
		String pagingImg = BoardPage.pagingImg(totalCount, pageSize, blockPage, pageNum, req.getContextPath()+"/shop?");
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("minPrice", ppmin);
		model.addAttribute("maxPrice", ppmax);
		return "home";
	}
	
	@RequestMapping("/view")
	public String view (@RequestParam int pidx, Model model, Principal principal) {
		
		String user_id = null;
		if(principal != null) {user_id = principal.getName();}
		
		ProductDTO productDTO = dao.pview(pidx);
		if(productDTO == null) {return "auth/error";}
		int aidx = productDTO.getAidx();
		ArtistDTO artistDTO = dao.aview(aidx);
		
		productDTO.setP_intro(productDTO.getP_intro().replaceAll("\n", "<br/>"));
		artistDTO.setA_history(artistDTO.getA_history().replaceAll("\n", "<br/>"));
		artistDTO.setA_intro(artistDTO.getA_intro().replaceAll("\n", "<br/>"));
		
		List<ProductDTO> aplist = dao.selectbya(aidx);
		ReviewDTO reviewDTO = dao.rview(pidx);
		
		model.addAttribute("pdto", productDTO);
		model.addAttribute("adto", artistDTO);
		model.addAttribute("rdto", reviewDTO);
		model.addAttribute("aplist", aplist);
		model.addAttribute("user_id", user_id);
		
		return "view";
	}
	
	@RequestMapping("/cart")
	public String welcome2(Principal principal, Model model, HttpServletRequest req, ProductDTO productDTO, MemberDTO memberDTO, CartDTO cartDTO) {
		try {
			int pidx = Integer.parseInt(req.getParameter("pidx"));
			String user_id = principal.getName(); //로그인아이디 얻어온다.
			memberDTO = dao.mview(user_id);
			cartDTO.setMidx(memberDTO.getMidx());
			cartDTO.setPidx(pidx);
			
			List<CartDTO> clist = dao.cview(memberDTO.getMidx());
			clist.add(cartDTO);
			
			List<ProductDTO> plist = new ArrayList<>();
			for(CartDTO cdto : clist) {
				productDTO = dao.pview(cdto.getPidx());
				plist.add(productDTO);
			}
			
			model.addAttribute("plist", plist);
			model.addAttribute("mdto", memberDTO);
		}catch (Exception e){
			System.out.println("로그인 전입니다.");
		}
		return "cart";
	}
	
	@RequestMapping("/member/index")
	public String welcome2() {
		return "member";
	}
	
	/* 커스텀로그인페이지매핑. 스프링시큐리티는 세션사용해서 로그인정보저장하지만 개발자가 직접 접근할수없으므로, Principal 객체통해 로그인아이디를 얻어올수있다 */
	@RequestMapping("/login")
	public String login1(Principal principal, Model model) {
		try {
			String user_id = principal.getName(); //로그인아이디 얻어온다.
			model.addAttribute("user_id", user_id); //아이디를 모델객체에 저장
			System.out.println("로그인에 성공했습니다.");
		}catch (Exception e){
			/* 최초접근시엔 로그인정보가 없으므로 널포인터 예외 발생하므로 예외처리해야한다. */
			System.out.println("로그인 전입니다.");
		} 
		if (SecurityUtils.isLoggedIn()) return "home";
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
	
}
