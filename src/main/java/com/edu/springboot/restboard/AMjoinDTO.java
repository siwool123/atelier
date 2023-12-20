package com.edu.springboot.restboard;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;

@Data
public class AMjoinDTO {
	private int bid_idx;
	private int auc_idx;
	private int pidx;
	private int midx;
	private int aprice;
	private Date aucdate;
	private String id;
	private Date penaltydate;
	private Date paydate;
	
	private String m_name;
	private String phone;
	private String zip;
	private String addr1;
	private String addr2;
	private java.sql.Date regidate;
	private java.sql.Date leavedate;
	private String profiles;
	private String places;
	private int total_point;
	private String token;
}
