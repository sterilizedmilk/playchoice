package com.playchoice.actor.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.actor.dto.PlayAppearDTO;
import com.playchoice.common.PageDTO;
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
	
	//연극 별 배우 가져오기
	public List<ActorDTO> palist(int p_id) throws Exception{		
		return sqlSession.selectList(namespace + ".palist", p_id);
	}
	//연극 별 배우 리스트 페이징
	public List<ActorDTO> palistPaging(int p_id, PageDTO dto) throws Exception{	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("p_id", p_id);
		map.put("pageDTO", dto);
		return sqlSession.selectList(namespace + ".palistPaging", map);
	}
	
	//배우 연극 추가
	@Override
	public int painsert(PlayAppearDTO padto) throws Exception {
		return sqlSession.insert(namespace + ".painsert", padto);
	}
	//연극별 배우 삭제
	@Override
//	public void padelete(int a_id) throws Exception {
//		sqlSession.delete(namespace + ".padelete", a_id);
//	}
	public void padelete(PlayAppearDTO padto) throws Exception {
		sqlSession.delete(namespace + ".padelete", padto);
	}
}
