package com.edu.springboot.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.edu.springboot.restboard.PointDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
//import jakarta.servlet.http.Part;

@Controller
public class MemberController2 {
	
	@Autowired
	Imember2Service dao;
	
	
	@Autowired
	PPPayController payServic;

	@RequestMapping("/rest/orderProc.do")
	public Order11DTO orderProc(Order11DTO order11DTO, PointDTO pointDTO, HttpServletRequest req) {
		
		System.out.println("메시");
		try {
			return order11DTO = payServic.order11Proc(order11DTO, pointDTO, req);
			
//			model.addAttribute("odto", orderDTO);
//			model.addAttribute("resultMsg", "주문이 성공적으로 처리되었습니다.");
//			session.setAttribute("odto", orderDTO);
//			session.setAttribute("resultMsg", "주문이 성공적으로 처리되었습니다.");
//			return "redirect:/member/orderResult?oidx="+orderDTO.getOidx();
		}catch (Exception e){ 
			e.printStackTrace();
			System.out.println("주문 처리 실패"); 
//			model.addAttribute("resultMsg", "주문처리중 오류가 발생했습니다.");
			return order11DTO;
    	}	
		
	}
	
	
	@RequestMapping("/rest/insertMemberr.do")
	public void insertMember(Member2DTO member2dto) {
		
		dao.insertMemberr(member2dto);
	}
	
//	@RequestMapping("/rest/insertPProduct.do")
//	public void insertPProduct(ProductDTO productDTO) {
//		dao.insertPProduct(productDTO);
////		dao.insertMemberr(member2dto);
//	}
	
	@PostMapping("/rest/insertPProduct.do")
	   public ResponseEntity<String> insertPProduct(
			   @RequestParam("sfile") MultipartFile file, HttpServletRequest req, ProductDTO productDTO) {
	      try {
	         String uploadDir = ResourceUtils.getFile("classpath:static/uploads/").toPath().toString();// 변경 필요
//	         String uploadDir = "/PProjectLogin/src/main/resources/static/uploads/";
	         
	         productDTO.setTitle(req.getParameter("title"));
	         productDTO.setAidx(req.getParameter("aidx"));
	         productDTO.setSize2(req.getParameter("size2"));
	         productDTO.setSize1(req.getParameter("size1"));
	         productDTO.setP_type(req.getParameter("p_type"));
	         productDTO.setPrice(req.getParameter("price"));
	         productDTO.setP_intro(req.getParameter("p_intro"));
	         productDTO.setFramed(req.getParameter("p_framed"));
	         productDTO.setM_name(req.getParameter("m_name"));
	         productDTO.setMidx(req.getParameter("midx"));
	         
	         System.out.println("물리적 경로 : " + uploadDir);

	         if (file != null) {
	        	 String originalFileName = file.getOriginalFilename();
	        	 String uniqueFileName = UUID.randomUUID().toString() + "_" + originalFileName;
	        	 
//	        	 String qq = "";
//	        	 List<Member2DTO> qqqq = dao.seletMember("midx", req.getParameter("midx"));
//	        	 if (qqqq.get(0).getProfiles() != null) {
//	        	     qq = qqqq.get(0).getProfiles().toString();
//	        	     File ddd = new File(uploadDir + File.separator + qq );
//	        	     ddd.delete();
//	        	 }
	        	 productDTO.setSfile(uniqueFileName);
//	        	 member2dto.setProfileo(uniqueFileName);
//	        	 dao.updateMprofile(uniqueFileName, req.getParameter("midx"));
	        	 
	        	 File destFile = new File(uploadDir, uniqueFileName);

	            System.out.println(uniqueFileName);
	            System.out.println(destFile);
	            file.transferTo(destFile);

	            System.out.println("파일 업로드 성공");
	            // 파일 업로드 성공에 대한 응답을 클라이언트에게 전송할 수 있음
	            return ResponseEntity.ok("파일 업로드 성공");
	         } else {
	            // Handle the case where the file is null
	            System.out.println("파일이 선택되지 않았습니다.");
	            // 파일이 선택되지 않은 경우에 대한 응답을 클라이언트에게 전송할 수 있음
	            return ResponseEntity.badRequest().body("파일이 선택되지 않았습니다.");
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	         System.out.println("업로드 실패");
	         // 업로드 실패에 대한 응답을 클라이언트에게 전송할 수 있음
	         return ResponseEntity.status(500).body("업로드 실패");
	      }
	   }
	
	
	@RequestMapping("/rest/insertCart.do")
	public void insertCart(CartDTO cartDTO) {
		dao.insertCart(cartDTO);
	}
	
	
	
	@RequestMapping("/rest/delete.do")
	public void deleteCart(HttpServletRequest req) {
		
		dao.deleteCart(req.getParameter("cidx"));
	}
	
	@RequestMapping("/rest/updateMprofile.do")
	public void updateMprofile(HttpServletRequest req) {
//		dao.updateMprofile(req.getParameter("midx"), req.getParameter("image"));
	}
	
	
 @PostMapping("/rest/uploadProfile1.do")
   public ResponseEntity<String> uploadProfileProcess1(@RequestParam("profiles") MultipartFile file, HttpServletRequest req) {
      try {
         String uploadDir = ResourceUtils.getFile("classpath:static/uploads/").toPath().toString();// 변경 필요
//         String uploadDir = "/PProjectLogin/src/main/resources/static/uploads/";

         System.out.println("물리적 경로 : " + uploadDir);

         if (file != null) {
        	 String originalFileName = file.getOriginalFilename();
        	 String uniqueFileName = UUID.randomUUID().toString() + "_" + originalFileName;
        	 
        	 String qq = "";
        	 List<Member2DTO> qqqq = dao.seletMember("midx", req.getParameter("midx"));
        	 if (qqqq.get(0).getProfiles() != null) {
        	     qq = qqqq.get(0).getProfiles().toString();
        	     File ddd = new File(uploadDir + File.separator + qq );
        	     ddd.delete();
        	 }
        	 
//        	 member2dto.setProfileo(uniqueFileName);
        	 dao.updateMprofile(uniqueFileName, req.getParameter("midx"));
        	 
        	 File destFile = new File(uploadDir, uniqueFileName);

            System.out.println(uniqueFileName);
            System.out.println(destFile);
            file.transferTo(destFile);

            System.out.println("파일 업로드 성공");
            // 파일 업로드 성공에 대한 응답을 클라이언트에게 전송할 수 있음
            return ResponseEntity.ok("파일 업로드 성공");
         } else {
            // Handle the case where the file is null
            System.out.println("파일이 선택되지 않았습니다.");
            // 파일이 선택되지 않은 경우에 대한 응답을 클라이언트에게 전송할 수 있음
            return ResponseEntity.badRequest().body("파일이 선택되지 않았습니다.");
         }
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println("업로드 실패");
         // 업로드 실패에 대한 응답을 클라이언트에게 전송할 수 있음
         return ResponseEntity.status(500).body("업로드 실패");
      }
   }
 
 
 @PostMapping("/rest/registArtist.do")
 public ResponseEntity<String> registArtist(@RequestParam("profileo") MultipartFile[] file, 
		 @RequestParam("midx") String midx, @RequestParam("a_history") String a_history, 
		 @RequestParam("a_intro") String a_intro) {
     try {
        String uploadDir = ResourceUtils.getFile("classpath:static/uploads/").toPath().toString();
        System.out.println("물리적 경로 : " + uploadDir);

        if (file != null) {
        	List<String> aa = new ArrayList<String>();
        	
        	String midx1 = midx;
        	String a_history1 = a_history;
        	String a_intro1 = a_intro;
        	
        	int indd = 0;
        for(MultipartFile tt : file) {
        	
        	String originalFileName = tt.getOriginalFilename();

        	
//        	aa.add(originalFileName);
        	String uniqueFileName = UUID.randomUUID().toString() + "_" + originalFileName;
        	File destFile = new File(uploadDir, uniqueFileName);
        	System.out.println(originalFileName);
        	System.out.println(destFile);
        	tt.transferTo(destFile);
        	aa.add(uniqueFileName);
        	
        	System.out.println("파일 업로드 성공");
        	indd ++;
        	// 파일 업로드 성공에 대한 응답을 클라이언트에게 전송할 수 있음
        }
        dao.applyArtist(midx1, a_intro1, a_history1, aa);
        return ResponseEntity.ok("파일 업로드 성공");
        } else {
           // Handle the case where the file is null
           System.out.println("파일이 선택되지 않았습니다.");
           // 파일이 선택되지 않은 경우에 대한 응답을 클라이언트에게 전송할 수 있음
           return ResponseEntity.badRequest().body("파일이 선택되지 않았습니다.");
        }
     } catch (Exception e) {
        e.printStackTrace();
        System.out.println("업로드 실패");
        // 업로드 실패에 대한 응답을 클라이언트에게 전송할 수 있음
        return ResponseEntity.status(500).body("업로드 실패");
     }
  }
 
 @RequestMapping("/rest/insertlike.do")
 public void insertlike(HttpServletRequest req) {
	 dao.insertlike(req.getParameter("pidx"), req.getParameter("aidx"), req.getParameter("midx"));
 }
 
 @RequestMapping("/rest/removelike.do")
 public void removelike(HttpServletRequest req) {
	 dao.removelike(req.getParameter("lidx"));
 }
 
 
 	
	
	
}
