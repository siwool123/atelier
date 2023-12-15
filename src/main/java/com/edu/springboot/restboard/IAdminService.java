package com.edu.springboot.restboard;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IAdminService {
	public int adminTotalCount(ParameterDTO parameterDTO);
	public ArrayList<MemberDTO> adminList(ParameterDTO parameterDTO);
	public int memberLeave(ParameterDTO parameterDTO);	
	public int memberDelete(ParameterDTO parameterDTO);	
}
