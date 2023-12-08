package com.edu.springboot.restboard;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;

@Data
@Builder
@ToString
public class ProductDTO {
	private String title;
	private int pidx;
	private int aidx;
	private int auction;
	private int size1;
	private int size2;
	private String theme;
	private String p_type;
	private int p_like;
	private int price;
	private String p_intro;
	private int framed;
	private java.sql.Date regidate;
	private String ofile;
	private String sfile;
	private int sold;
	private int midx;
	private String m_name;
	private String material;
}
