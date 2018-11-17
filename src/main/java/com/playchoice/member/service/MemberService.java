package com.playchoice.member.service;

import com.playchoice.member.dto.LoginDTO;
import com.playchoice.member.dto.MemberDTO;

public interface MemberService {
	
	// 회원가입
	public void insertMember(MemberDTO dto) throws Exception;
	
	// 회원정보 수정
	public void updateMember(MemberDTO dto) throws Exception;
	
	// 회원탈퇴
	public void deleteMember(String m_id) throws Exception;
	
	// 회원정보 보기
	public MemberDTO viewMember(String m_id) throws Exception;
	
	// 아이디 중복체크
	public boolean duplicateId(String m_id) throws Exception;
	
	// 로그인
	public MemberDTO loginMember(LoginDTO dto) throws Exception;

	// 아이디 찾기
	public String findId(MemberDTO dto);
	
	// 비밀번호 찾기
	public String findPw(MemberDTO dto);

}
