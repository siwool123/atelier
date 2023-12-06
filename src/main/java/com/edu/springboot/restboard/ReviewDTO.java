package com.edu.springboot.restboard;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;

@Data
@Builder
@ToString
public class ReviewDTO {
	private int ridx;
	private int pidx;
	private int aidx;
	private int midx;
	private java.sql.Date r_ate;
	private String r_content;
	private int r_like;
	private int star;
	private String sfile1;
	private String sfile2;
	private String sfile3;
}
