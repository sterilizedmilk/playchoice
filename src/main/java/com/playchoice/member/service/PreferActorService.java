package com.playchoice.member.service;

import java.util.List;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.member.dto.PreferActorDTO;

public interface PreferActorService {

	// 선호 배우 목록
	public List<ActorDTO> preferActorList(int m_code) throws Exception;
	
	// 선호 배우 추가
	public void insertPrefer(PreferActorDTO dto) throws Exception;
	
	// 선호 배우 삭제
	public void deletePrefer(int a_id) throws Exception;
	
	// 선호배우 목록에 동일한 배우가 있는지 검사
	public int countPrefer(int m_code, int a_id) throws Exception;
	
}
