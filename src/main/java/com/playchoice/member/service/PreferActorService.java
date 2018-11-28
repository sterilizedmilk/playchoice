package com.playchoice.member.service;

import java.util.List;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.common.PageDTO;
import com.playchoice.member.dto.PreferActorDTO;

public interface PreferActorService {

	// 찜한 배우 목록
	public List<ActorDTO> preferActorList(int m_code) throws Exception;
	
	// 찜한 배우 목록 페이징
	public List<ActorDTO> preferActorPaging(int m_code, PageDTO dto) throws Exception;
	
	// 총 목록 수
	public int preferActorCount(int m_code) throws Exception;
	
	// 찜한 배우 추가
	public void insertPrefer(PreferActorDTO dto) throws Exception;
	
	// 찜한 배우 삭제
	public void deletePrefer(int a_id) throws Exception;
	
	// 찜한 배우 목록에 동일 배우가 있는지 체크
	public int countPrefer(int m_code, int a_id) throws Exception;
	
}
