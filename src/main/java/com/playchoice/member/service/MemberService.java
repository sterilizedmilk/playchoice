package com.playchoice.member.service;

import com.playchoice.member.dto.LoginDTO;
import com.playchoice.member.dto.MemberDTO;

public interface MemberService {
	
	// 회원 가입
	public void insertMember(MemberDTO dto) throws Exception;
	
	// 로그인
	public MemberDTO loginMember(LoginDTO dto) throws Exception;

	// 아이디 찾기
	public String findId(MemberDTO dto);
	
	// 비밀번호 찾기
	public String findPw(MemberDTO dto);
	
	// 회원 정보 조회
	public MemberDTO viewMember(String m_id) throws Exception;
	
	// 회원 정보 수정
	public void updateMember(MemberDTO dto) throws Exception;
	
	// 회원 탈퇴
	public void deleteMember(String m_id) throws Exception;
	
	// 아이디 중복 체크
	public boolean duplicateId(String m_id) throws Exception;
	
	// 이메일 중복 체크
	public boolean duplicateMail(String m_mail) throws Exception;
	
	// 회원 정보 수정 및 삭제를 위한 비밀번호 체크
	public boolean checkPw(String m_id, String m_pw) throws Exception;
	
	// 비밀번호 변경
	public boolean updatePw(String m_id, String m_pw, String new_pw) throws Exception;
	
}
