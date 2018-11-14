package com.playchoice.member.service;

import java.util.HashMap;
import java.util.List;

import com.playchoice.member.dto.MemberDTO;

public interface MemberService {

	
	//로그인 기능
	public Object loginMember(MemberDTO dto) throws Exception;

	//아이디 찾기
	public String findId(MemberDTO dto);
	
	//암호 찾기
	public String findPw(MemberDTO dto);
}
