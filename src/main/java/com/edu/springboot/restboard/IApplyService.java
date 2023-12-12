package com.edu.springboot.restboard;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IApplyService {
	//작가신청 사진 업로드
	public int aaupdate(ApplyDTO applyDTO);
}
