package com.edu.springboot.restboard;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IMemberService {

	//회원목록
	public List<MemberDTO> mlist();
	//회원가입
	public int minsert(MemberDTO memberDTO);
	//회원정보출력
	public MemberDTO mview(String id);
	//회원정보수정
	public int mupdate(MemberDTO memberDTO);
	//회원탈퇴(삭제가 아닌 비활성화)
	public int leave(String id);
	//회원영구삭제
	public int mdelete(MemberDTO memberDTO);
	//프로필 사진 업로드
	public int mpupdate(MemberDTO memberDTO);
	//프로필 사진 삭제
	public int mpdelete(MemberDTO memberDTO);
	//비번변경
	public int mpedit(MemberDTO memberDTO);
}
