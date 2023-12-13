package com.edu.springboot.restboard;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;

@Data
public class OrderDTO {
	private String oidx;
	private int midx;
	private String paymethod;
	private int price;
	private Date orderdate;
	private Date paydate;
	private String receiver;
	private String r_phone;
	private String r_address;
	private String message;
	private Date shipdate;
	private String courier;
	private String t_num;
	private String owner;
	private String apinum;
}
