package com.edu.springboot.restboard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
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
	@GetMapping("/restBoardList.do")
	public List<BoardDTO> restBoardList(ParameterDTO parameterDTO) {
		
		//json배열로 출력하므로 list컬렉션을 반환한다
		int pageSize = 10; //한페이지에10개씩출력
		int pageNum = (parameterDTO.getPageNum()==null) ? 1 : Integer.parseInt(parameterDTO.getPageNum()); //페이지번호가져오기
		
		//게시물의 구간계산
		int start = (pageNum-1)*pageSize+1; 
		int end = pageNum*pageSize;
		
		//DTO에 저장후 매퍼 호출한다
		parameterDTO.setStart(start);
		parameterDTO.setEnd(end);
		// 매퍼의 select 엘리먼트는 쿼리실행결과를 리스트로 반환한다
		List<BoardDTO> boardList = dao.list(parameterDTO);
		return boardList;		
	}
	
	@GetMapping("/restBoardSearch.do")
	public List<BoardDTO> restBoardSearch(HttpServletRequest req, ParameterDTO parameterDTO) {
		
		//searchField는 parameterDTO가 받음. searchWord 는 별도로 저장해야함
		if(req.getParameter("searchWord")!=null) {
			parameterDTO.getSearchWord().clear();
			for(String str : req.getParameter("searchWord").split(" ")) {
				System.out.println(str); parameterDTO.getSearchWord().add(str);
			}
		}
		List<BoardDTO> searchList = dao.search(parameterDTO);
		return searchList;		
	}
	
	@GetMapping("/restBoardView.do")
	public BoardDTO restBoardView(ParameterDTO parameterDTO) {
		
		BoardDTO boardDTO = dao.view(parameterDTO);
		return boardDTO;		
	}
	
	@PostMapping("/restBoardWrite.do")
	public Map<String, Integer> restBoardWrite(HttpServletRequest req) {
		int result = dao.write(req.getParameter("title"), req.getParameter("content"), req.getParameter("id"));
		Map<String, Integer> map = new HashMap<>();
		map.put("result", result);
		return map;		
	}
	
}
