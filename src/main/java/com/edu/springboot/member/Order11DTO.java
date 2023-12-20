package com.edu.springboot.member;

import java.util.List;

import lombok.Data;

@Data
public class Order11DTO {
	
	

	private String  oidx;
	private String midx;
	private String paymethod;
	private String price;
	private String orderdate;
	private String paydate;
	private String receiver;
	private String r_phone;
	private String r_address;
	private String message;
	private String shipdate;
	private String courier;
	private String t_num;
	private String owner;
	private String apinum;
	private String auction;
	private String pidx;
	private String add_point;
	private String minus_point;
	
	private List<String> pidxList;
	private List<String> priceList;
	private List<String> aidxList;
}
