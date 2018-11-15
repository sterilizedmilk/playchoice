package com.playchoice.actor.dao;

import java.util.List;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.actor.dto.SearchActorDTO;
import com.playchoice.play.dto.PlayDTO;

public interface ActorDAO {

	public ActorDTO getActor(int a_id);
	
	public List<ActorDTO> searchActor(SearchActorDTO search);

	public int insertActor(ActorDTO dto);

	public int updateActor(ActorDTO dto);

	public int addPreferActor(int m_id, int a_id);

	public List<PlayDTO> getAppearedPlays(int a_id);

}
