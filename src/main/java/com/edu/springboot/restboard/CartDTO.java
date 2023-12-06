package com.edu.springboot.restboard;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.ToString;

@Data
@Builder
@ToString
public class CartDTO {
	private int cidx;
	private int pidx;
	private int midx;
}
