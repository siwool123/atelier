package com.edu.springboot.restboard;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IAdminService {
	//회원관리
	public int adminTotalCount(ParameterDTO parameterDTO);
	public ArrayList<MemberDTO> adminList(ParameterDTO parameterDTO);
	public int memberLeave(ParameterDTO parameterDTO);	
	public int memberDelete(ParameterDTO parameterDTO);
	
	//아티스트신청관리
	public int artistTotalCount(ParameterDTO parameterDTO);
	public ArrayList<ApplyDTO> artistList(ParameterDTO parameterDTO);
	public ApplyDTO artistView(ParameterDTO parameterDTO);
	public int artistPassChange(ParameterDTO parameterDTO);
	public int artistNewInsert(ApplyDTO applyDTO);
	public int authority(int midx);
	
	//작가관리
	public List<ArtistDTO> alist2();
	
}
