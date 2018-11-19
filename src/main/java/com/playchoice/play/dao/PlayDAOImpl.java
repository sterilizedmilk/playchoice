package com.playchoice.play.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playchoice.play.dto.PlayDTO;
import com.playchoice.play.dto.PlayshowDTO;
import com.playchoice.play.dto.SearchPlayDTO;

@Repository
public class PlayDAOImpl implements PlayDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String namespace = "com.playchoice.mappers.playMapper"; //config 파일 설정해놓지않으면 풀네임을 써야한다
	

	@Override
	public List<PlayDTO> playList() {
		System.out.println("daoList start");
		return sqlSession.selectList(namespace + ".playList");
	}

	@Override
	public PlayDTO playDetail(int p_id) { //detail
		System.out.println("daoDetail start");
		return sqlSession.selectOne(namespace + ".playDetail", p_id);
	}

	@Override
	public List<PlayDAO> playSearch(SearchPlayDTO search) {
		return null;
	}

	@Override
	public int playAdd(PlayDTO dto) {
		return 0;
	}

	@Override
	public int playPost(int p_id) {
		return 0;
	}

	@Override
	public int playDetach(int p_id) {
		return 0;
	}

	@Override
	public List<Object> viewCal(HashMap<String,Object> param) {
		System.out.println("viewCal Dao입니다");
	
		List<Object> res = new ArrayList<Object>();
		res = sqlSession.selectList(namespace+".viewCal", param);
		System.out.println(res);
		
		return res;
	}

}
