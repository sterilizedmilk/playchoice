package com.playchoice.member.service;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.member.dao.MemberDAO;
import com.playchoice.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDao;


	@Override
	public Object loginMember(MemberDTO dto) throws Exception {

		return memberDao.loginMember(dto);

	}

	@Override
	public String findId(MemberDTO dto) {
		Object obj = (MemberDTO)memberDao.findId(dto);
		if(obj == null) {
			return "fail";
		}else {
			return ((MemberDTO)obj).getM_id();
		
		}
	}

	@Override
	public String findPw(MemberDTO dto) {
		//임시 비밀번호 난수 6글자 조합
		Random random = new Random();
		String tmp="";
		while(tmp.length()<=6) {
			switch(random.nextInt(3)) {
			case 0:
				//소문자
				tmp += String.valueOf((char)(int)(random.nextInt(26)+97));
				break;
			case 1:
				//대문자
				tmp += String.valueOf((char)(int)(random.nextInt(26)+65));
				break;
			case 2:
				//숫자
				tmp += String.valueOf(random.nextInt(10));
				break;
			}
		}
		dto.setM_pw(tmp);
		if(memberDao.findPw(dto) < 1) {
			return "fail";
		}else {
			return tmp;
		}
			
	}

}
