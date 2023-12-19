package com.edu.springboot.restboard;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;

@Data
public class OPjoinDTO {
	private String oidx;
	private int midx;
	private String paymethod;
	private int price;
	private Date orderdate;
	private Date paydate;
	private Date shipdate;
	private String courier;
	private String t_num;
	private int auction;
	private int pidx;
	private String sfile;
	private String title;
	private String m_name;
	
	private String receiver;
	private String r_phone;
	private String r_address;
	private String message;
	private String owner;
	
	private int tprice;
	private int add_point;
	private int minus_point;
	private int o2idx;
	
	private int size1;
	private int size2;
	private int ridx;
}
