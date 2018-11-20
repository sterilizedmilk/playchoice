package com.playchoice.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playchoice.member.dto.LoginDTO;
import com.playchoice.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String namespace = "com.playchoice.mapper.memberMapper";
	
	// 회원 가입
	@Override
	public void insertMember(MemberDTO dto) throws Exception {
		sqlSession.insert(namespace + ".insertMember", dto);		
	}

	// 회원 정보 조회
	@Override
	public MemberDTO viewMember(String m_id) throws Exception {
		return sqlSession.selectOne(namespace + ".viewMember", m_id);
	}
	
	// 이메일로 회원 정보 조회
	@Override
	public MemberDTO viewMemberByEmail(String m_mail) throws Exception {
		return sqlSession.selectOne(namespace + ".viewMemberByEmail", m_mail);
	}

	// 회원 정보 수정
	@Override
	public void updateMember(MemberDTO dto) throws Exception {
		sqlSession.update(namespace + ".updateMember", dto);
	}
	
	// 회원 탈퇴
	@Override
	public void deleteMember(String m_id) throws Exception {
		sqlSession.delete(namespace + ".deleteMember", m_id);
	}
	
	// 로그인
	@Override
	public MemberDTO loginMember(LoginDTO dto) throws Exception {
		return sqlSession.selectOne(namespace + ".loginMember", dto);
	}
	
	// 아이디 찾기
	@Override
	public Object findId(MemberDTO dto) {
		return sqlSession.selectOne(namespace + ".findId", dto);
	}
	
	// 비밀번호 찾기
	@Override
	public int findPw(MemberDTO dto) {
		return sqlSession.update(namespace + ".findPw", dto);
	}

	// 회원 정보 수정 및 삭제를 위한 비밀번호 체크
	@Override
	public boolean checkPw(String m_id, String m_pw) throws Exception {
		boolean result = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("m_pw", m_pw);
		int cnt = sqlSession.selectOne(namespace + ".checkPw", map);
		if(cnt == 1) {
			result = true;
		}
		return result;
	}

	// 비밀번호 변경
	@Override
	public int updatePw(String m_id, String new_pw) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("m_pw", new_pw);
		return sqlSession.update(namespace + ".updatePw", map);
	}

}
