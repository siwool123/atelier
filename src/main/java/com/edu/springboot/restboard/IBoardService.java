package com.edu.springboot.restboard;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.edu.springboot.pay.PaymentDTO;

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
	public int delCart(int pidx);
	
	//주문추가
	public int payorder(OrderDTO orderDTO);
	public int bankorder(OrderDTO orderDTO);
	public int insertorder2(Order2DTO order2DTO);
	
	//주문시 해당작품 판매완료로 변경
	public int setsold(int pidx);
	//주문번호구하기
	public String orderNum(int midx);
	
	//멤버테이블에 포인트 사용 및 적립 반영
	public int memberPoint(int point, int midx);
	
	//포인트테이블에 포인트사용 삽입
	public int pinsert(PointDTO pointDTO);
	
	//주문조회1
	public List<OPjoinDTO> opjoin(ParameterDTO parameterDTO);
	
	//회원번호로 주문리스트 조회
	public List<OrderDTO> olist(int midx);
	
	//입금전 건수 조회
	public List<OrderDTO> notPaid(int midx); 
	//배송전 건수 조회
	public List<OrderDTO> notShipped(int midx); 
	
	//주문번호로 주문리스트 조회
	public List<Order2DTO> o2list(String oidx);
	
	//주문번호로 주문상세정보조회
	public OrderDTO oview(String oidx);
	
	//주문날짜 시분초까지조회
	public String orderdate(String oidx);
	
	//주문조회2
	public List<OPjoinDTO> opjoin2(String oidx);
}


