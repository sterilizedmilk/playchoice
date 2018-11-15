package com.playchoice.member.service;

import java.util.List;

import com.playchoice.member.dto.MemberDTO;

public interface MemberService {

	// 멤버 목록
	public List<MemberDTO> memberList() throws Exception;
	
	// 멤버 등록
	public void insertMember(MemberDTO dto) throws Exception;
	
	// 멤버 수정
	public void updateMember(MemberDTO dto) throws Exception;
	
	// 멤버 삭제
	public void deleteMember(String m_id) throws Exception;
	
	// 멤버 상세보기
	public MemberDTO viewMember(String m_id) throws Exception;
	
	// 아이디 중복체크
	public boolean duplicateId(String m_id) throws Exception;
	
	//로그인 기능
	public Object loginMember(MemberDTO dto) throws Exception;

	//아이디 찾기
	public String findId(MemberDTO dto);
	
	//암호 찾기
	public String findPw(MemberDTO dto);
	
}
