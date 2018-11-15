package com.playchoice.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playchoice.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String namespace = "com.playchoice.mapper.memberMapper";
	
	@Override
	public Object loginMember(MemberDTO dto) throws Exception {
		return sqlSession.selectOne(namespace +".login", dto);
	}
	
	@Override
	public Object findId(MemberDTO dto) {
		return sqlSession.selectOne(namespace +".findId", dto);
	}
	
	@Override
	public int findPw(MemberDTO dto) {
		return sqlSession.update(namespace +".findPw", dto);
	}
	
	@Override
	public List<MemberDTO> memberList() throws Exception {
		return sqlSession.selectList(namespace + ".memberList");
	}
	
	@Override
	public void insertMember(MemberDTO dto) throws Exception {
		sqlSession.insert(namespace + ".insertMember", dto);		
	}

	@Override
	public MemberDTO getMemberById(String m_Id) throws Exception {
		return sqlSession.selectOne(namespace + ".getMemberById", m_Id);
	}

	@Override
	public void updateMember(MemberDTO dto) throws Exception {
		sqlSession.update(namespace + ".updateMember", dto);
	}

	@Override
	public void deleteMember(String m_id) throws Exception {
		sqlSession.delete(namespace + ".deleteMember", m_id);
	}

	@Override
	public MemberDTO getMemberByCode(Integer m_code) throws Exception {
		return sqlSession.selectOne(namespace + ".getMemberByCode", m_code);
	}
	
}
