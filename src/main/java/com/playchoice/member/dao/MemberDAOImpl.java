package com.playchoice.member.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playchoice.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String namespace = "com.playchoice.mybatis.mappers.Login";
	

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
}
