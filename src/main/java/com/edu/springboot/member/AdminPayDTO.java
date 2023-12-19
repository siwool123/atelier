package com.edu.springboot.member;

import java.util.List;

import lombok.Data;

@Data
public class AdminPayDTO {

	private String oidx;
	private String auction ;
	private String pidx;
	private String sfile;
	private String title;
	private String a_name;
	private String price;
//	private List<String> pidx;
//	private List<String> sfile;
//	private List<String> title;
//	private List<String>  a_name;
//	private List<String>  price;
	private String m_name;
//	private String buyer;
	private String paydate;
	private String shipdate;
	private String t_num; 
	private String state;
	
}
