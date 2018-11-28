package com.playchoice.actor.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.actor.dto.SearchActorDTO;
import com.playchoice.play.dto.PlayDTO;

@Repository
public class ActorDAOImpl implements ActorDAO {
	
	@Autowired
	SqlSessionTemplate session;
	String namespace = "com.playchoice.mappers.ActorMapper";
	
	public List<ActorDTO> listActor(){
		return session.selectList(namespace+".listActor");
	}
	
	public List<ActorDTO> seachActor(String keyword){
		return session.selectList(namespace+".listActorSeach",keyword);
	}
	
	@Override
	public ActorDTO getActor(int a_id) {
		return session.selectOne(namespace + ".getActor", a_id);
	}

	@Override
	public List<ActorDTO> searchActor(SearchActorDTO search) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int addPreferActor(int m_id, int a_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<PlayDTO> getAppearedPlays(int a_id) {
		// TODO Auto-generated method stub
		return null;
	}

	//배우 찜하기
	@Override
	public int mypickActor(HashMap<String, Object> param) {
		
		return session.insert(namespace+".mypickActor", param);
	}

}
