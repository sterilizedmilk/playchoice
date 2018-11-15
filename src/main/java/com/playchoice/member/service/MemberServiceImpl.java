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
		} else {
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

	@Override
	public List<MemberDTO> memberList() throws Exception {
		return memberDao.memberList();
	}

	@Override
	public void insertMember(MemberDTO dto) throws Exception {
		memberDao.insertMember(dto);	
	}

	@Override
	public void updateMember(MemberDTO dto) throws Exception {
		memberDao.updateMember(dto);
	}

	@Override
	public void deleteMember(String m_id) throws Exception {
		memberDao.deleteMember(m_id);
	}

	@Override
	public MemberDTO viewMember(String m_id) throws Exception {
		return memberDao.getMemberById(m_id);
	}

	@Override
	public boolean duplicateId(String m_id) throws Exception {
		MemberDTO dto = null;
		dto = memberDao.getMemberById(m_id);
		if(dto != null) {
			return true;
		}
		return false;
	}

}
