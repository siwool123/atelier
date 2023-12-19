package com.edu.springboot.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.edu.springboot.restboard.Order2DTO;

@Mapper
public interface Imember2Service {
	
	/// 작품 판매 중 상태로 업데이트
	public List<Order2DTO> selector2(@Param("sField") String sField,  @Param("sWord") String sWord);
	
	
	/// 작품 판매 중 상태로 업데이트
	public void updatePro(@Param("pidx") String pidx );
	//// 스케줄러
	public void updateOrder1(@Param("oidx") String oidx ,@Param("cancel") String cancel);
	
	public List<Member2DTO> seletMember
		(@Param("searchField") String searchField, @Param("searchWord") String searchWord);
	
	public List<Member2DTO> seletMember1
	(@Param("my_id") String my_id, @Param("my_pass") String my_pass);
	
	public void insertMemberr(Member2DTO member2dto);
	
	public List<CartDTO> seletCart
	(CartDTO cartDTO, @Param("midx") String midx);
	
	public List<P_likeDTO> likeCart
	(P_likeDTO p_likeDTO);
	
	public List<Integer> seletCartp
	(@Param("midx") String midx, @Param("buy") String buy);
	
	public void updateMprofile(@Param("profiles") String profiles,@Param("midx") String midx);
	
//	public void updateCartp(@Param("cidx") String cidx, @Param("buy") String buy);
	
	public void insertCart(CartDTO cartDTO);
	
	public void insertPProduct(ProductDTO productDTO);
	
	public void deleteCart(@Param("cidx") String cidx);
	
	public List<ProductDTO> seletProduct
		(ProductDTO productDTO, @Param("sField") List<String> sField, @Param("sWord") List<String> sWord,
				@Param("title") List<String> title, @Param("price") List<String> price, @Param("size2") List<String> size2);
	
	public int price(@Param("order") String order);
	
	public List<Artist2DTO> artistL(@Param("artist") String artist);
	
	public String getMImage(@Param("midx") String midx);
	
	public List<ApplyDTO>  getMImageL(ApplyDTO applyDTO);
	
	
	
	public void applyArtist(@Param("midx") String midx, @Param("a_intro") String a_intro, 
			@Param("a_history") String a_history, @Param("apply") List<String> apply);
	
	
	public void insertlike(@Param("pidx") String pidx,@Param("aidx") String aidx,@Param("midx") String midx);
	
	public void removelike(@Param("lidx") String lidx);
	
	public int insertOrder11(Order11DTO order11dto);
	public int insertOrder12(@Param("oidx") String oidx,@Param("pidx") String pidx,@Param("aidx") String aidx,
			@Param("price") String price,@Param("midx") String midx);
	
	public List<Order11DTO> selectOrder11oidx(@Param("pidx") String pidx);

}
