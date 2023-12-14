package com.edu.springboot.pay;

import java.sql.Date;

import lombok.Data;

@Data
public class PaymentDTO {

	private String total_amount;
	private String payUserName;
	private String sumPrice;
	private String discountPrice;
	private String totalPrice;
	private String tel;
	private String email;
	private String usePoint;
}
