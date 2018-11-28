package com.playchoice.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.common.PageDTO;
import com.playchoice.member.dto.PreferActorDTO;

@Repository
public class PreferActorDAOImpl implements PreferActorDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String namespace = "com.playchoice.mapper.preferMapper";
	
	// 찜한 배우 목록
	@Override
	public List<ActorDTO> preferActorList(int m_code) throws Exception {
		return sqlSession.selectList(namespace + ".preferActorList", m_code);
	}

	// 찜한 배우 목록 페이징
	@Override
	public List<ActorDTO> preferActorPaging(int m_code, PageDTO dto) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_code", m_code);
		map.put("pageDTO", dto);
		return sqlSession.selectList(namespace + ".preferActorPaging", map);
	}
	
	// 총 목록 수
	@Override
	public int preferActorCount(int m_code) throws Exception {
		return sqlSession.selectOne(namespace + ".preferActorCount", m_code);
	}
	
	// 찜한 배우 추가
	@Override
	public void insertPrefer(PreferActorDTO dto) throws Exception {
		sqlSession.insert(namespace + ".insertPrefer", dto);
	}

	// 찜한 배우 삭제
	@Override
	public void deletePrefer(int a_id) throws Exception {
		sqlSession.delete(namespace + ".deletePrefer", a_id);
	}

	// 찜한 배우 목록에 동일 배우가 있는지 체크
	@Override
	public int countPrefer(int m_code, int a_id) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_code", m_code);
		map.put("a_id", a_id);
		return sqlSession.selectOne(namespace + ".countPrefer", map);
	}

}
