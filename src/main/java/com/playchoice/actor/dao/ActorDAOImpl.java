package com.playchoice.actor.dao;

import java.util.List;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.actor.dto.SearchActorDTO;
import com.playchoice.play.dto.PlayDTO;

public class ActorDAOImpl implements ActorDAO {

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
