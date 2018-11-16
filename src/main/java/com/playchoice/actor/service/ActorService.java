package com.playchoice.actor.service;

import java.util.HashMap;
import java.util.List;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.actor.dto.SearchActorDTO;

public interface ActorService {
	
	public List<ActorDTO> listActor (String keyword); 
//	public List<ActorDTO> listActor(SearchActorDTO search);
	
	public int insertActor(HashMap<String, Object> param);
	
}
