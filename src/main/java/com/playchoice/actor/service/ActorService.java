package com.playchoice.actor.service;

import java.util.List;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.member.dto.MemberDTO;

public interface ActorService {
	
	public List<ActorDTO> listActor (String keyword); 
	
	public int mypickActor(MemberDTO dto, String a_id);
	
	// 배우 아이디 가져오기
	public ActorDTO getActor(int a_id) throws Exception;
	
	// 주연배우 평점 가져오기
	public double getReviewScore(int a_id) throws Exception;
	
}
