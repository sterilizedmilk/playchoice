package com.playchoice.actor.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.actor.dto.SearchActorDTO;
import com.playchoice.play.dto.PlayDTO;

public interface ActorDAO {
	
	public List<ActorDTO> listActor();
	
	public List<ActorDTO> seachActor(String keyword);
	
	// 배우 아이디 가져오기
	public ActorDTO getActor(int a_id);
	
	public List<ActorDTO> searchActor(SearchActorDTO search);

	public int addPreferActor(int m_id, int a_id);

	public List<PlayDTO> getAppearedPlays(int a_id);

	public int mypickActor(HashMap<String, Object> param);
	
	// 주연배우1 평점 가져오기
	public Map<String, Integer> getReviewScore1(int a_id) throws Exception;
	
	// 주연배우2 평점 가져오기
	public Map<String, Integer> getReviewScore2(int a_id) throws Exception;

}
