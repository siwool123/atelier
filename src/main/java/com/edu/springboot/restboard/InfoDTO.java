package com.edu.springboot.restboard;

import java.util.ArrayList;

import lombok.Data;

@Data
public class InfoDTO {

	private String mailServer;
	private String from;
	private String to;
	private String subject;
	private String format;
	private String content;
	private String randnum;
	
	private String phoneto;
	private String smsContent;
	
	private String logId;
	private String logPass;
	
	private String saveEmail;
	
	private String findPassId;
	private String findPassNum;
	private String findPassSubject;
	
	private String searchField;
	private ArrayList<String> searchWord;
}
