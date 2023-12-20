package com.edu.springboot;

import java.io.File;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.springboot.pay.PayService;
import com.edu.springboot.restboard.ApplyDTO;
import com.edu.springboot.restboard.ArtistDTO;
import com.edu.springboot.restboard.IApplyService;
import com.edu.springboot.restboard.IMemberService;
import com.edu.springboot.restboard.MemberDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import utils.MyFunctions;

@Controller
public class ApplyController {

	@Autowired
	IMemberService dao;
	
	@Autowired
	IApplyService adao;
	
	@Autowired
	PayService payService;
	
	//작가신청 페이지
	@RequestMapping("member/apply")
	String apply(Principal principal, Model model, MemberDTO memberDTO, ApplyDTO applyDTO) {
		
		Map<Object, Object> map = payService.memberIndex(principal);
        model.addAttribute("map", map);
        
		try {
			String user_id = principal.getName(); //로그인아이디 얻어온다.
			memberDTO = dao.mview(user_id);
			applyDTO = adao.aview(memberDTO.getMidx());
			if (applyDTO!=null) {
				System.out.println("applyDTO is not null");
				/*
				 * applyDTO.setA_intro(applyDTO.getA_intro().replace("\r\n","</br>"));
				 * applyDTO.setA_history(applyDTO.getA_intro().replace("\r\n","</br>"));
				 */
				model.addAttribute("mdto", memberDTO);
				model.addAttribute("apdto", applyDTO);
				model.addAttribute("apresult","1");
			} else {
				System.out.println("applyDTO is null");
				model.addAttribute("mdto", memberDTO);
				model.addAttribute("apresult","0");
			}
			System.out.println(memberDTO);
			System.out.println(applyDTO);
		}catch (Exception e){
			System.out.println("작가신청 페이지 접속 실패");
		}
		return "member/apply";
	}
	
	//작가신청 페이지
		@RequestMapping("member/applyResult")
		String applyResult(Principal principal, Model model, MemberDTO memberDTO, ApplyDTO applyDTO) {
			try {
				String user_id = principal.getName(); //로그인아이디 얻어온다.
				memberDTO = dao.mview(user_id);
				applyDTO = adao.aview(memberDTO.getMidx());
				if (applyDTO!=null) {
					System.out.println("applyDTO is not null");
					/*
					 * applyDTO.setA_intro(applyDTO.getA_intro().replace("\r\n","</br>"));
					 * applyDTO.setA_history(applyDTO.getA_intro().replace("\r\n","</br>"));
					 */
					model.addAttribute("mdto", memberDTO);
					model.addAttribute("apdto", applyDTO);
					model.addAttribute("apresult","1");
				} else {
					System.out.println("applyDTO is null");
					model.addAttribute("mdto", memberDTO);
					model.addAttribute("apresult","0");
					return "redirect:/member/apply";
				}
				System.out.println(memberDTO);
				System.out.println(applyDTO);
			}catch (Exception e){
				System.out.println("작가신청 페이지 접속 실패");
			}
			return "member/applyResult";
		}
	
	//작가신청(소개,이력,작품10개 업로드)
	@PostMapping("member/apply.do")
	String applyProcess(Principal principal, HttpServletRequest req, Model model, MemberDTO memberDTO, ApplyDTO applyDTO) {
		try {
			//물리적 경로 얻어오기 
			String uploadDir = ResourceUtils
				.getFile("classpath:static/uploads/").toPath().toString();
			System.out.println("물리적경로:"+uploadDir);
			
			List<String> savedFileNames = new ArrayList();
			
			for(int n=1; n<=10; n++) {
				//전송된 첨부파일을 Part객체를 통해 얻어온다. 
				Part part = req.getPart("inputApply"+n);	
				System.out.println(part.getSize());
				if (part.getSize() > 0) {
					System.out.println("파일있음");
				} else {
					System.out.println("파일 없음. 잘못된 접근. 함수종료");
					return "redirect:/member/apply";
				}
				System.out.println("3");
				//파일명 확인을 위해 헤더값을 얻어온다. 
				String partHeader = part.getHeader("content-disposition");
				System.out.println("partHeader="+ partHeader);
				//헤더값에서 파일명 추출을 위해 문자열을 split()한다. 
				String[] phArr = partHeader.split("filename=");
				//따옴표를 제거한 후 원본파일명을 추출한다. 
				String originalFileName = phArr[1].trim().replace("\"", "");
				//파일명을 중복되지 않는 이름으로 변경한다. 
				String savedFileName = MyFunctions.renameFile(uploadDir, originalFileName);
				//전송된 파일이 있다면 서버에 저장한다. 
				if (!savedFileName.isEmpty()) {				
					part.write(uploadDir+ File.separator +savedFileName);
				}
				System.out.println("파일 업로드 성공 / 저장된 파일 이름 : "+savedFileName);
				// 파일명을 리스트에 추가
	            savedFileNames.add(savedFileName);
			}
			
			// applyDTO 객체에 파일명 할당
	        for (int i = 0; i < savedFileNames.size(); i++) {
	            switch (i + 1) {
	                case 1:
	                    applyDTO.setApply1(savedFileNames.get(i));
	                    break;
	                case 2:
	                    applyDTO.setApply2(savedFileNames.get(i));
	                    break;
	                case 3:
	                    applyDTO.setApply3(savedFileNames.get(i));
	                    break;
	                case 4:
	                    applyDTO.setApply4(savedFileNames.get(i));
	                    break;
	                case 5:
	                    applyDTO.setApply5(savedFileNames.get(i));
	                    break;
	                case 6:
	                    applyDTO.setApply6(savedFileNames.get(i));
	                    break;
	                case 7:
	                    applyDTO.setApply7(savedFileNames.get(i));
	                    break;
	                case 8:
	                    applyDTO.setApply8(savedFileNames.get(i));
	                    break;
	                case 9:
	                    applyDTO.setApply9(savedFileNames.get(i));
	                    break;
	                case 10:
	                    applyDTO.setApply10(savedFileNames.get(i));
	                    break;
	                default:
	                    // 예외 처리 혹은 다른 로직 추가 가능
	                    break;
	            }
	        }
			
	        System.out.println("파일 업로드 성공 / 저장된 파일 이름(list) : " + savedFileNames);
	        
	        applyDTO.setMidx(dao.mview(principal.getName()).getMidx());
			//JDBC연동
	        int result = adao.ainsert(applyDTO);
	        System.out.println(result);
			if(result != 0) {
				System.out.println("jdbc연동 성공 (applyDTO) : "+adao.aview(applyDTO.getMidx()));
			} else {
				System.out.println("실패");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			System.out.println("업로드 실패");
		}
		
		return "redirect:/member/apply";
	}
	
}
