package com.edu.springboot.restboard;

import java.util.ArrayList;

import lombok.Data;

@Data
public class ParameterDTO {
	private String pidx;
	private String pageNum;
	private String sField;
	private ArrayList<String> sWord;
	private int start;
	private int end;
	
	private String orderby;
	private String pmin;
	private String pmax;
	private String sell;
	private String ori;
	private String size;
	private String cate;
	private String ptype;
}
