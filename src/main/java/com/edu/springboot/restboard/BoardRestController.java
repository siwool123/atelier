package com.edu.springboot.restboard;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;

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
	
	@PostMapping("member/rest/plike")
	public int plikeplus(HttpServletRequest req, Principal principal, Model model) {
		int result = 0;
		String user_id = principal.getName();
		MemberDTO memberDTO = dao.mview(user_id);
		int pidx = Integer.parseInt(req.getParameter("pidx"));
		ProductDTO productDTO = dao.pview(pidx);
		PlikeDTO plikeDTO = dao.plview(pidx, memberDTO.getMidx());
		if(plikeDTO!=null) {
			result = dao.pldelete(plikeDTO.getLidx()) * -1;
		}else {result = dao.pladd(pidx, productDTO.getAidx(), memberDTO.getMidx());}
		return result;
	}
	
}
