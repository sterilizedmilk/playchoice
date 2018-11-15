package com.playchoice.actor.dao;

import java.util.ArrayList;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ActorDTO> searchActor(SearchActorDTO search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertActor(ActorDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateActor(ActorDTO dto) {
		// TODO Auto-generated method stub
		return 0;
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

}
