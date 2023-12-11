package com.edu.springboot.restboard;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class ArtistDTO {
	private int aidx;
	private int midx;
	private String m_name;
	private String profiles;
	private String a_intro;
	private String a_history;
	private int subscriber;
	private java.sql.Date regidate;
}
