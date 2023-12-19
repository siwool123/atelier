package com.edu.springboot.restboard;

import java.sql.Date;

import lombok.Data;

@Data
public class PointDTO {
	private int point_idx;
	private int midx;
	private int add_point;
	private Date point_date;
	private String oidx;
	private int minus_point;
	private int pidx;
	private int ridx;
	private String title;
	private String m_name;
}
