package com.edu.springboot.member;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;

@RestController
public class MemberRestController {

	@Autowired
	Imember2Service dao;
	
	
//	@RequestMapping("/login")
//	public String login1(Principal principal, Model model, HttpServletRequest req) {
//		
//		try {
//			String user_id = principal.getName(); //로그인아이디 얻어온다.
//			model.addAttribute("user_id", user_id); //아이디를 모델객체에 저장
//			if(user_id!=null) return "home";
//			System.out.println("로그인에 성공했습니다.");
//		}catch (Exception e){
//			/* 최초접근시엔 로그인정보가 없으므로 널포인터 예외 발생하므로 예외처리해야한다. */
//			System.out.println("로그인 전입니다.");
//		} 
//		return "auth/login";
//	}
//	
	@RequestMapping("/login1")
	public String login1(Model model, HttpServletRequest req, Principal principal) {
		
		System.out.println(req.getParameter("my_id"));//로그인아이디 얻어온다.
		System.out.println(req.getParameter("my_pass"));
		
		try {
			if (principal != null) {
	            System.out.println(principal.getName());
	            String searchField = req.getParameter("my_id");
	            String searchWord = req.getParameter("my_pass");

	            List<Member2DTO> memberList = dao.seletMember1(searchField, searchWord);

	            if (!memberList.isEmpty()) {
	                return memberList.get(0).getMidx();
	            }
	        } else {
	            // 로그인이 되어 있지 않은 경우에 대한 처리
	            System.out.println("로그인 전입니다.");
	        }
			
		}catch (Exception e){
//			/* 최초접근시엔 로그인정보가 없으므로 널포인터 예외 발생하므로 예외처리해야한다. */
			System.out.println("로그인 전입니다.");
			e.printStackTrace();
		} 
		
			
			
			return "호날두";
	}
	
//	@RequestMapping("/loginAction1")
//	public String login12(Model model, HttpServletRequest req) {
//		
//		System.out.println(req.getParameter("my_id"));//로그인아이디 얻어온다.
//		System.out.println(req.getParameter("my_pass"));
//		
//			
//			String searchField = req.getParameter("my_id");
//			String searchWord = req.getParameter("my_pass");
//			
//			
//			List<Member2DTO> memberList = dao.seletMember(searchField, searchWord);
//			
//			if(!memberList.isEmpty()) {
//				return memberList.get(0).getMidx();				
//			}
//			return "호날두";
//	}
	
	@RequestMapping("/rest/member2.api")
	public List<Member2DTO> member2(Member2DTO member2dto, HttpServletRequest req){
		
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		
		
		List<Member2DTO> memberList = dao.seletMember(searchField, searchWord);
		
		return memberList;
	}
	
	@RequestMapping("/rest/cart1.api")
	public List<CartDTO> cart(CartDTO cartDTO, HttpServletRequest req){
		
		String midx = req.getParameter("midx");
		List<CartDTO> memberList = dao.seletCart(cartDTO, midx);
		return memberList;
	}
	
	@RequestMapping("/rest/cartp.api")
	public List<Integer> cart1(CartDTO cartDTO, HttpServletRequest req){
		
		String midx = req.getParameter("midx");
		String buy = req.getParameter("buy");
		List<Integer> memberList = dao.seletCartp(midx, buy);
//		List<CartDTO> memberList = dao.seletCart(cartDTO, midx);
		return memberList;
	}
	
	
	@RequestMapping("/rest/like.api")
	public List<P_likeDTO> pddd(P_likeDTO p_likeDTO){
		
//		List<Integer> memberList = dao.seletCartp(midx, buy);
		List<P_likeDTO> memberList = dao.likeCart(p_likeDTO);
		return memberList;
	}
	
	
	
	
	@RequestMapping("/rest/price.api")
	public int priceee(HttpServletRequest req) {
		
		int ii = 0;
		
		if(req.getParameter("order") != null) {
			ii = dao.price(req.getParameter("order"));
			System.out.println("호날두ㅜㅜㅜㅜㅜㅜ");
		}
		
		return ii;
	}
	
	@RequestMapping("/rest/artist.api")
	public List<Artist2DTO> restArtist(HttpServletRequest req){
		
		String artist = "";
		
		if(req.getParameter("artist") != null) {
			artist = req.getParameter("artist");
		}
		
		List<Artist2DTO> att = dao.artistL(artist);
		
		return att;
	}
	
	
	@RequestMapping("/rest/product.api")
	public List<ProductDTO> restBoardSearch(HttpServletRequest req,
			ProductDTO productDTO){
		
		List<ProductDTO> productList = new ArrayList<>();
		
		List<String> sField = new ArrayList<String>();
		List<String> sWord = new ArrayList<String>();
		List<String> title = new ArrayList<String>();
		List<String> price = new ArrayList<String>();
		List<String> size2 = new ArrayList<String>();
		
		if(req.getParameter("size2") != null) {
			String[] sTxtArray = req.getParameter("size2").split("!");
			for(String s: sTxtArray) {
				size2.add(s);
			}
		}
		
		if(req.getParameter("title") != null) {
			String[] sTxtArray = req.getParameter("title").split(" ");
			for(String s: sTxtArray) {
				title.add(s);
			}
		}
		
		if(req.getParameter("price") != null) {
			String[] sTxtArray = req.getParameter("price").split("!");
			for(String s: sTxtArray) {
				price.add(s);
			}
		}
		
		int t = 1;
		
		while (req.getParameter("sWord"+t)!=null) {
			
			System.out.println(t);
				sField.add(req.getParameter("sField"+t));
				sWord.add(req.getParameter("sWord"+t));
			t++;
		} 
		
//		productList = (dao.seletProduct(productDTO, sField, sWord, title, price, size2));
		productList = dao.seletProduct(productDTO, sField, sWord, title, price, size2);
		
		return productList;
	}
	
//	@GetMapping("PProjectLogin/src/main/resources/static/uploads/memberImage.api")
//    public String getImageUrl(HttpServletRequest req) {
//		
//		return dao.getMImage(req.getParameter("midx"));
//		
//    }
	
	@GetMapping("/rest/memberProfile.api")
	public ResponseEntity<Resource> mempro(HttpServletRequest req) {
		
		
		try {
			String fileName = dao.getMImage(req.getParameter("midx"));
//			fileName = fileName.split("_")[1];
//			String path = ResourceUtils.getFile("classpath:static/uploads/").toPath().toString()+"/";
			String path = "static/uploads/" + fileName;
			
			Resource resource = new ClassPathResource(path);
			
			HttpHeaders header = new HttpHeaders();
	        header.add("Content-Type", Files.probeContentType(Paths.get(resource.getURI())));

			
			return new ResponseEntity<Resource>(resource, header, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
		
		
		
	}

	
	
	@GetMapping("/rest/applypicture1.api")
	public ResponseEntity<Resource> applypicture(ApplyDTO applyDTO) {
		
		
		try {
			
			List<ApplyDTO> dd = dao.getMImageL(applyDTO);
			
			ApplyDTO ap = dd.get(0);
			String path = "static/uploads/" ;
			if(applyDTO.getApply1() != null) {
				path += ap.getApply1();
			}
			if(applyDTO.getApply2() != null) {
				path += ap.getApply2();
			}
			if(applyDTO.getApply3() != null) {
				path += ap.getApply3();
			}
			if(applyDTO.getApply4() != null) {
				path += ap.getApply4();
			}
			if(applyDTO.getApply5() != null) {
				path += ap.getApply5();
			}
			if(applyDTO.getApply6() != null) {
				path += ap.getApply6();
			}
			if(applyDTO.getApply7() != null) {
				path += ap.getApply7();
			}
			if(applyDTO.getApply8() != null) {
				path += ap.getApply8();
			}
			if(applyDTO.getApply9() != null) {
				path += ap.getApply9();
			}
			if(applyDTO.getApply10() != null) {
				path += ap.getApply10();
			}
			
			Resource resource = new ClassPathResource(path);
			
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(Paths.get(resource.getURI())));
			
			return new ResponseEntity<Resource>(resource, header, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
		
		
		
	}
	
	
	@GetMapping("/rest/imagefile.api")
	public ResponseEntity<Resource> imagefile(HttpServletRequest req) {
		
		
		try {
			
			String path = "static/uploads/" ;
			
			
			path += req.getParameter("image");
			
			Resource resource = new ClassPathResource(path);
			
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(Paths.get(resource.getURI())));
			
			return new ResponseEntity<Resource>(resource, header, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
		
		
		
	}
	
	@GetMapping("/rest/restapply.do")
	public List<ApplyDTO>  apppp(ApplyDTO applyDTO) {
		return dao.getMImageL(applyDTO);
	}
	
}
