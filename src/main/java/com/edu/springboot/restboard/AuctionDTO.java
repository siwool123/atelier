package com.edu.springboot.restboard;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;

@Data
public class AuctionDTO {
	private int bid_idx;
	private int auc_idx;
	private int pidx;
	private int midx;
	private int aprice;
	private Date aucdate;
	private String id;
	private Date penaltydate;
	private Date paydate;
}
