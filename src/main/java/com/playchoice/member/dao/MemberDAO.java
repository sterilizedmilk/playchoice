package com.playchoice.member.dao;

import java.util.List;

import com.playchoice.member.dto.MemberDTO;

public interface MemberDAO {

	// 멤버 목록
	public List<MemberDTO> memberList() throws Exception;
	
	// 멤버 등록
	public void insertMember(MemberDTO dto) throws Exception;
	
	// 코드로 멤버 가져오기
	public MemberDTO getMemberByCode(Integer m_code) throws Exception;
	
	// 아이디로 멤버 가져오기
	public MemberDTO getMemberById(String m_id) throws Exception;
	
	// 멤버 수정
	public void updateMember(MemberDTO dto) throws Exception;
	
	// 멤버 삭제
	public void deleteMember(String m_id) throws Exception;
		
	//로그인멤버
	public Object loginMember(MemberDTO dto) throws Exception;
	
	//아이디 찾기
	public Object findId(MemberDTO dto);
	
	//비밀번호 찾기
	public int findPw(MemberDTO dto);
	
}