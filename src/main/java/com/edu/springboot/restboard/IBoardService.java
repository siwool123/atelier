package com.edu.springboot.restboard;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface IBoardService {
	
	//Paging 처리를 위해 게시물의 갯수를 카운트
	public int totalCount();
	
	//게시판 목록(페이징 기능 추가)
	public ArrayList<BoardDTO> list(ParameterDTO parameterDTO);
	
	//게시물 검색
	public ArrayList<BoardDTO> search(ParameterDTO parameterDTO);
	
	//내용보기
	public BoardDTO view(ParameterDTO parameterDTO);
	
	//게시물작성
	public int write(@Param("title") String title, @Param("content") String content, @Param("id") String id);
}


