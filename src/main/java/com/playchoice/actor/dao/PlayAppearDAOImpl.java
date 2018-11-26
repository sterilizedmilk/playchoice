package com.playchoice.actor.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playchoice.play.dto.PlayDTO;

@Repository
public class PlayAppearDAOImpl implements PlayAppearDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String namespace = "com.playchoice.mapper.appearMapper";
	
	// 출연 작품 목록
	@Override
	public List<PlayDTO> appearList(int a_id) throws Exception {
		return sqlSession.selectList(namespace + ".appearList", a_id);
	}
}
