package com.playchoice.actor.service;

import java.util.List;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.member.dto.MemberDTO;

public interface ActorService {
	
	public List<ActorDTO> listActor (String keyword); 
	
	public int mypickActor(MemberDTO dto, String a_id);
	
	public ActorDTO getActor(int a_id) throws Exception;
	
}
