package com.edu.springboot.restboard;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface IArtistService {
	
	//작가정보출력
	public ArtistDTO aview(int midx);
	
	//작가 작품 전체 출력
	public List<ProductDTO> aplist(int midx);
	
	//작가소개수정
	public int aintroupdate(ArtistDTO artistDTO);
	
	//작가약력수정
	public int ahistoryupdate(ArtistDTO artistDTO);

	//작가별 판매 중 작품 갯수 조회
	public int onselect(int aidx);
	
	//작가별 판매 완료 상품 갯수 조회
	public int solselect(int aidx);
	
	//작가별 판매된 작품들의 총가격 합산
	public int sumselect(ProductDTO productDTO);
	
	//작가별 경매중 상품의 갯수
	public int aucsselect(AuctionDTO auctionDTO);
	
	//작가별 경매 완료 상품의 갯수
	public int auceselect(AuctionDTO auctionDTO);
	
	//작가별 배송전 상품의 갯수
	public int shipsselect(ArtistDTO artistDTO);
	
	//작가별 배송 완료 상품의 갯수
	
	//작가별 좋아요 받은 상품 갯수의 합
	public int likesum(int aidx);
	
}
