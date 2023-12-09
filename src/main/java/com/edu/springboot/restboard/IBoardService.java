package com.edu.springboot.restboard;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface IBoardService {
	
	//Paging 처리를 위해 게시물의 갯수를 카운트
	public int totalCount(ParameterDTO parameterDTO);
	
	public int minprice();
	public int maxprice();
	
	public List<ProductDTO> pselectall();
	
	//게시판 목록(페이징 기능 추가)
	public List<ProductDTO> selectProduct(ParameterDTO parameterDTO);
	public List<ProductDTO> selectbya(int aidx);
	
	//게시물 검색
	public ArrayList<ProductDTO> search(ParameterDTO parameterDTO);
	
	//내용보기
	public ProductDTO pview(int pidx);
	public ArtistDTO aview(int aidx);
	public ReviewDTO rview(int pidx);
	public MemberDTO mview(String user_id);
	public List<CartDTO> cview(int midx);
	
	//게시물작성
	public int write(@Param("title") String title, @Param("content") String content, @Param("id") String id);
	
	//작품좋아요버튼
	public PlikeDTO plview(int pidx, int midx);
	public int pldelete(int lidx);
	public int pladd(@Param("pidx") int pidx, @Param("aidx") int aidx, @Param("midx") int midx);
	public int plikecount(int pidx);
	public int updateplcnt(int plcnt, int pidx);
	
	//작가페이지 리뷰보기
	public List<ReviewDTO> rvlistbya(ParameterDTO parameterDTO);
	public List<ProductDTO> productsbyas(ParameterDTO parameterDTO);
	
	//장바구니 아이템 중복여부확인
	public CartDTO cartview(ParameterDTO parameterDTO);
	//장바구니목록불러오기
	public List<CartDTO> cartsview(int midx);
	//장바구니 추가
	public int cartadd(ParameterDTO parameterDTO);
	//장바구니 삭제
	public int delete(int pidx);
}


