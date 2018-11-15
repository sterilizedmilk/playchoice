package com.playchoice.member.dao;

import com.playchoice.member.dto.LoginDTO;
import com.playchoice.member.dto.MemberDTO;

public interface MemberDAO {
	
	// 회원가입
	public void insertMember(MemberDTO dto) throws Exception;
	
	// 아이디로 회원 읽어오기
	public MemberDTO getMemberById(String m_id) throws Exception;
	
	// 멤버 수정
	public void updateMember(MemberDTO dto) throws Exception;
	
	// 멤버 삭제
	public void deleteMember(String m_id) throws Exception;
		
	// 로그인 회원 읽어오기
	public MemberDTO loginMember(LoginDTO dto) throws Exception;
	
	// 아이디 찾기
	public Object findId(MemberDTO dto);
	
	// 비밀번호 찾기
	public int findPw(MemberDTO dto);
	
}