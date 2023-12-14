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
	private String pidx;
	private String sfile;
	private String title;
	private String m_name;
}
