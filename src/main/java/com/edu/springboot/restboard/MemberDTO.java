package com.edu.springboot.restboard;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class MemberDTO {
	private String id;
	private String pass;
	private String m_name;
	private String phone;
	private String zip;
	private String addr1;
	private String addr2;
	private int midx;
	private java.sql.Date regidate;
	private java.sql.Date leavedate;
	private String profiles;
	private String places;
	private int total_point;
	private String token;
	private int enabled;
	private String authority;
	
}
