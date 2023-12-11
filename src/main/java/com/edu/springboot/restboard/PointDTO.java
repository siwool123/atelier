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
}
