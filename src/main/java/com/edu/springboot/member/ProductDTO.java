package com.edu.springboot.member;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductDTO {
	
	private String title;
	private String pidx;
	private String aidx;
	private String auction;
	private String size2;
	private String size1;
	private String theme;
	private String p_type;
	private String p_like;
	private String price;
	private String p_intro;
	private String framed;
	private Date regidate;
	private String sfile;
	private String sold;
	private String midx;
	private String m_name;
	private String material;
	
	private int ridx;
	private Date enddate;
	private int maxprice;
	private String bgimg;
}
