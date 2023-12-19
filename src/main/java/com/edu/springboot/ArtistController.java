package com.edu.springboot;

import java.io.File;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.pay.PayService;
import com.edu.springboot.restboard.ArtistDTO;
import com.edu.springboot.restboard.IArtistService;
import com.edu.springboot.restboard.IBoardService;
import com.edu.springboot.restboard.IMemberService;
import com.edu.springboot.restboard.MemberDTO;
import com.edu.springboot.restboard.ProductDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import utils.MyFunctions;

@Controller
public class ArtistController {

	@Autowired
	IMemberService dao;
	
	@Autowired
	IBoardService dao2;
	
	@Autowired
	PayService payService;
	
	@Autowired
	IArtistService ardao;

	//작가프로필 페이지
	@RequestMapping("artist/profile")
	public String artistProfile(Principal principal, Model model) {

		Map<Object, Object> map = payService.memberIndex(principal);
        model.addAttribute("map", map);
        
        try {
        String id = principal.getName();
        MemberDTO memberDTO = dao.mview(id);
        int midx = memberDTO.getMidx();
        
        ArtistDTO artistDTO = ardao.aview(midx);
        artistDTO.setA_intro(artistDTO.getA_intro());
        artistDTO.setA_history(artistDTO.getA_history());
        
        List<ProductDTO> aplist = ardao.aplist(midx);
        
        model.addAttribute("mdto", memberDTO);
        model.addAttribute("adto", artistDTO);
        model.addAttribute("aplist", aplist);
        model.addAttribute("soldsum", ardao.solselect(artistDTO.getAidx()));
        model.addAttribute("likesum", ardao.likesum(artistDTO.getAidx()));
        }catch(Exception e) {
        	e.printStackTrace();
        	System.out.println("작가정보조회실패");
        }
		return "artist/profile";
	}
	
	//판매작품등록 페이지
	@RequestMapping("artist/addProduct")
	public String addProduct(Principal principal, Model model, HttpServletRequest req) {
		
		Map<Object, Object> map = payService.memberIndex(principal);
        model.addAttribute("map", map);
		
		try {
	        String id = principal.getName();
	        MemberDTO memberDTO = dao.mview(id);
	        int midx = memberDTO.getMidx();
	        
	        ArtistDTO artistDTO = ardao.aview(midx);
	        artistDTO.setA_intro(artistDTO.getA_intro());
	        artistDTO.setA_history(artistDTO.getA_history());
	        
	        List<ProductDTO> aplist = ardao.aplist(midx);
	        
	        model.addAttribute("mdto", memberDTO);
	        model.addAttribute("adto", artistDTO);
	        model.addAttribute("aplist", aplist);
	        model.addAttribute("soldsum", ardao.solselect(artistDTO.getAidx()));
	        model.addAttribute("likesum", ardao.likesum(artistDTO.getAidx()));
	        
        	model.addAttribute("auction", "0");
	        
	        }catch(Exception e) {
	        	e.printStackTrace();
	        	System.out.println("작가정보조회실패");
	        }
		return "artist/addProduct";
	}
	
	//경매작품등록 페이지
		@RequestMapping("artist/addAuction")
		public String addAuction(Principal principal, Model model, HttpServletRequest req) {
			
			Map<Object, Object> map = payService.memberIndex(principal);
	        model.addAttribute("map", map);
			
			try {
		        String id = principal.getName();
		        MemberDTO memberDTO = dao.mview(id);
		        int midx = memberDTO.getMidx();
		        
		        ArtistDTO artistDTO = ardao.aview(midx);
		        artistDTO.setA_intro(artistDTO.getA_intro());
		        artistDTO.setA_history(artistDTO.getA_history());
		        
		        List<ProductDTO> aplist = ardao.aplist(midx);
		        
		        model.addAttribute("mdto", memberDTO);
		        model.addAttribute("adto", artistDTO);
		        model.addAttribute("aplist", aplist);
		        model.addAttribute("soldsum", ardao.solselect(artistDTO.getAidx()));
		        model.addAttribute("likesum", ardao.likesum(artistDTO.getAidx()));
		        
	        	model.addAttribute("auction", "1");
		        
		        }catch(Exception e) {
		        	e.printStackTrace();
		        	System.out.println("작가정보조회실패");
		        }
			return "artist/addProduct";
		}
	
	//판매작품등록
	@PostMapping("artist/addProduct.do")
	public String addProductProcess(Principal principal, Model model, ProductDTO pdto, HttpServletRequest req) {
		
		try {
			//물리적 경로 얻어오기 
			String uploadDir = ResourceUtils
				.getFile("classpath:static/uploads/").toPath().toString();
			System.out.println("물리적경로:"+uploadDir);
			
			Part part = req.getPart("addProdImg");
			String partHeader = part.getHeader("content-disposition");
			System.out.println("partHeader="+partHeader);
			String[] phArr = partHeader.split("filename=");
			String savedFileName = phArr[1].trim().replace("\"","");
			savedFileName = MyFunctions.renameFile(uploadDir, savedFileName);
			if(!savedFileName.isEmpty()) {
				part.write(uploadDir+File.separator+savedFileName);
			}
			System.out.println("작품 사진 업로드 성공. 저장된 파일 이름 : "+savedFileName);
			pdto.setSfile(savedFileName);
			
			String id = principal.getName();
	        
			MemberDTO mdto = dao.mview(id);
	        int midx = mdto.getMidx();
	        String mname = mdto.getM_name();
	        
	        ArtistDTO adto = ardao.aview(midx);
			int aidx = adto.getAidx();
			
			pdto.setAidx(aidx);
			pdto.setMidx(midx);
			pdto.setM_name(mname);
			
			System.out.println(pdto);
			
			int result = ardao.prodinsert(pdto);
			if (result == 1) {
				System.out.println("상품 업로드 성공");
			} else {
				System.out.println("상품 업로드 실패");
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
			return "redirect:/artist/addProduct";
		}
		return "redirect:/artist/addProduct";
	}
	
	//판매작품내역
	@RequestMapping("artist/sellHistory")
	public String sellHistory(Principal principal, Model model) {
		Map<Object, Object> map = payService.memberIndex(principal);
        model.addAttribute("map", map);
		
		try {
	        String id = principal.getName();
	        MemberDTO memberDTO = dao.mview(id);
	        int midx = memberDTO.getMidx();
	        
	        ArtistDTO artistDTO = ardao.aview(midx);
	        artistDTO.setA_intro(artistDTO.getA_intro());
	        artistDTO.setA_history(artistDTO.getA_history());
	        
	        List<ProductDTO> aplist = ardao.aplist(midx);
	        
	        model.addAttribute("mdto", memberDTO);
	        model.addAttribute("adto", artistDTO);
	        model.addAttribute("aplist", aplist);
	        model.addAttribute("soldsum", ardao.solselect(artistDTO.getAidx()));
	        model.addAttribute("likesum", ardao.likesum(artistDTO.getAidx()));
	        }catch(Exception e) {
	        	e.printStackTrace();
	        	System.out.println("작가정보조회실패");
	        }
		return "artist/sellHistory";
	}
	
	//정산내역
	@RequestMapping("artist/settleHistory")
	public String settleHistory(Principal principal, Model model) {
		Map<Object, Object> map = payService.memberIndex(principal);
        model.addAttribute("map", map);
		
		try {
	        String id = principal.getName();
	        MemberDTO memberDTO = dao.mview(id);
	        int midx = memberDTO.getMidx();
	        
	        ArtistDTO artistDTO = ardao.aview(midx);
	        artistDTO.setA_intro(artistDTO.getA_intro());
	        artistDTO.setA_history(artistDTO.getA_history());
	        
	        List<ProductDTO> aplist = ardao.aplist(midx);
	        
	        model.addAttribute("mdto", memberDTO);
	        model.addAttribute("adto", artistDTO);
	        model.addAttribute("aplist", aplist);
	        model.addAttribute("soldsum", ardao.solselect(artistDTO.getAidx()));
	        model.addAttribute("likesum", ardao.likesum(artistDTO.getAidx()));
	        }catch(Exception e) {
	        	e.printStackTrace();
	        	System.out.println("작가정보조회실패");
	        }
		return "artist/settleHistory";
	}
}
