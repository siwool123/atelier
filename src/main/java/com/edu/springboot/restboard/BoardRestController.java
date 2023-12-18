package com.edu.springboot.restboard;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.edu.springboot.pay.PayService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

//메서드에서 보든 반환값은 웹브라우저에 즉시 출력된다.
@RestController
public class BoardRestController {

	@Autowired
	IBoardService dao;
	
	/* board테이블의 레코들르 각 페이지별로 구분해서 배열형태로 출력한다.
	 * 페이지 번호가 없는 경우 1페이지의 내용을 출력한다. */
	@GetMapping("/rest/productList.api")
	public List<ProductDTO> restBoardList(HttpServletRequest req, ParameterDTO parameterDTO) {
		
		if(req.getParameter("sWord")!=null) {
			parameterDTO.getSWord().clear();
			for(String str : req.getParameter("sWord").split(" ")) {
				System.out.println(str); parameterDTO.getSWord().add(str);
			}
		}
		
		//json배열로 출력하므로 list컬렉션을 반환한다
		int pageSize = 9; //한페이지에10개씩출력
		int pageNum = (parameterDTO.getPageNum()==null) ? 1 : Integer.parseInt(parameterDTO.getPageNum()); //페이지번호가져오기
		
		//게시물의 구간계산
		int start = (pageNum-1)*pageSize+1; 
		int end = pageNum*pageSize;
		parameterDTO.setStart(start); //DTO에 저장후 매퍼 호출한다
		parameterDTO.setEnd(end);
		// 매퍼의 select 엘리먼트는 쿼리실행결과를 리스트로 반환한다
		List<ProductDTO> plist = dao.selectProduct(parameterDTO);
		System.out.println(plist.size());
		return plist;		
	}
		
	@GetMapping("/rest/productSearch.api")
	public List<ProductDTO> restBoardSearch(HttpServletRequest req, ParameterDTO parameterDTO) {
		
		//sField는 parameterDTO가 받음. sWord 는 별도로 저장해야함
		if(req.getParameter("sWord")!=null) {
			parameterDTO.getSWord().clear();
			for(String str : req.getParameter("sWord").split(" ")) {
				System.out.println(str); parameterDTO.getSWord().add(str);
			}
		}
		List<ProductDTO> searchList = dao.search(parameterDTO);
		return searchList;		
	}
	
	@GetMapping("/restProductView.api")
	public ProductDTO restBoardView(HttpServletRequest req) {
		
		ProductDTO productDTO = dao.pview(Integer.parseInt(req.getParameter("pidx")));
		return productDTO;		
	}
	
	@PostMapping("/restProductWrite.api")
	public Map<String, Integer> restBoardWrite(HttpServletRequest req) {
		int result = dao.write(req.getParameter("title"), req.getParameter("content"), req.getParameter("id"));
		Map<String, Integer> map = new HashMap<>();
		map.put("result", result);
		return map;		
	}
	
	@GetMapping("/rest/plike")
	public int plikeplus(@RequestParam int pidx, Principal principal) {
		int result = 0;
		System.out.println(dao.pview(pidx).getAidx());
		try {
			if(principal!=null) {String user_id = principal.getName();  
				System.out.println(user_id);
				MemberDTO memberDTO = dao.mview(user_id);
				if(memberDTO!=null) {
					System.out.println(memberDTO.getMidx());
					PlikeDTO plikeDTO = dao.plview(pidx, memberDTO.getMidx());
					if(plikeDTO!=null) { 
						System.out.println(plikeDTO.getLidx());
						result = dao.pldelete(plikeDTO.getLidx()) * -1;
					}else {result = dao.pladd(pidx, dao.pview(pidx).getAidx(), memberDTO.getMidx());}
			}
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("찜 실패");
		}
		int plcnt = dao.plikecount(pidx);
		dao.updateplcnt(plcnt, pidx);
		
		return result;
	}
	
	@GetMapping("/rest/vartist")
	public List<ProductDTO> a0view (@RequestParam int aidx, @RequestParam int sold, ParameterDTO parameterDTO) {
		System.out.println("rest호출됨");
		int pageSize = 8;//한 페이지당 게시물 수
		int pageNum = (parameterDTO.getPageNum()==null) ? 1 : Integer.parseInt(parameterDTO.getPageNum()); //페이지번호가져오기
		int start = (pageNum-1) * pageSize + 1; //현재 페이지에 출력한 게시물의 구간을 계산한다.
		int end = pageNum * pageSize;
		parameterDTO.setStart(start); //계산된 값은 DTO에 저장한다.
		parameterDTO.setEnd(end);
		parameterDTO.setAidx(aidx);
		parameterDTO.setSold(sold);
		List<ProductDTO> aplist = dao.productsbyas(parameterDTO);
		
		return aplist;
	}
	
	@GetMapping("/rest/cart")
	public int cartview (@RequestParam int pidx, ParameterDTO parameterDTO, Principal principal) {
		
		System.out.println("rest호출됨");
		int result = 0;
		try { 
			String user_id = principal.getName(); //로그인아이디 얻어온다.  
			System.out.println(user_id);
			MemberDTO memberDTO = dao.mview(user_id);
			if(memberDTO!=null) {
				parameterDTO.setMidx(memberDTO.getMidx());
				parameterDTO.setPidx(pidx);
				CartDTO cartDTO = dao.cartview(parameterDTO);
				if(cartDTO!=null) {  System.out.println(cartDTO.getCidx());
					result = -1;
				}else {result = dao.cartadd(parameterDTO);}
			}
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("장바구니호출 실패");
		}
		return result;
	}
	
	@PostMapping("/member/delCart")
	public int pidxdelete(HttpServletRequest req, Model model) {
		int result = 0;
		int pidx = Integer.parseInt(req.getParameter("pidx"));
		result = dao.delCart(pidx);
		System.out.println("장바구니에서 작품 삭제결과:"+result);
		return result;
	}
	
	@PostMapping("/member/delReview")
	public int delRevew(HttpServletRequest req, Model model, Principal principal) {
		MemberDTO mdto = dao.mview(principal.getName());
		int result = 0, result2=0, result3=0, result4=0;
		int pidx = Integer.parseInt(req.getParameter("pidx"));
		ReviewDTO rdto = dao.rview(pidx);
		result = dao.delReview(pidx);
		result2 = dao.delRpoint(rdto.getRidx());
		result3 = dao.delRpointM(mdto.getMidx());
		result4 = dao.setreview2(pidx);
		try {
			String uploadDir = ResourceUtils.getFile("classpath:static/uploads/").toPath().toString();
			//기존파일삭제
			File file = new File( uploadDir + File.separator + rdto.getSfile1() );
			if(file.exists())	file.delete();
			File file2 = new File( uploadDir + File.separator + rdto.getSfile2() );
			if(file2.exists())	file2.delete();
			File file3 = new File( uploadDir + File.separator + rdto.getSfile3() );
			if(file3.exists())	file3.delete();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("리뷰의 첨부파일 삭제 실패");
		}
		
		System.out.println("리뷰삭제결과:"+result+"포인트차감결과 : "+result2+" : "+result3+", product테이블ridx제거 : "+result4);
		return result+result2+result3+result4;
	}
	
	@PostMapping("/rest/thumbplus")
	public int thumbplus(HttpServletRequest req, Model model, Principal principal) {
		int result = 0;
		int pidx = Integer.parseInt(req.getParameter("pidx"));
		result = dao.rlikeplus(pidx);
		
		System.out.println("리뷰좋아요추가결과:"+result);
		return result;
	}
}
