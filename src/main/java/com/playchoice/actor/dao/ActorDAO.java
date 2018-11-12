package com.playchoice.actor.dao;

import java.util.List;

import com.playchoice.SearchDTO;
import com.playchoice.actor.dto.ActorDTO;

public interface ActorDAO {

	public ActorDTO getActor(int a_id);

	public List<ActorDTO> searchActor(SearchDTO search); // ?

	public int addActor(ActorDTO dto);

}
