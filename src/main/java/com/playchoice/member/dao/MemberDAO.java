package com.playchoice.member.dao;

import com.playchoice.member.dto.MemberDTO;

public interface MemberDAO {

		//로그인멤버
		public Object loginMember(MemberDTO dto) throws Exception;
		
		//아이디 찾기
		public Object findId(MemberDTO dto);
		
		//비밀번호 찾기
		public int findPw(MemberDTO dto);
}
