package com.playchoice.actor.dao;

import java.util.List;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.actor.dto.PlayAppearDTO;
import com.playchoice.common.PageDTO;
import com.playchoice.play.dto.PlayDTO;

public interface PlayAppearDAO {

	// 출연 작품 목록
	public List<PlayDTO> appearList(int a_id) throws Exception;
	
	// 연극 별 배우 목록
	public List<ActorDTO> palist(int p_id) throws Exception;
	// 연극 별 배우 목록 페이징
	public List<ActorDTO> palistPaging(int p_id, PageDTO dto) throws Exception;
	
	//연극 배우추가 insert
	public int painsert(PlayAppearDTO padto) throws Exception;
	
	//연극별 배우 삭제
	public void padelete(int a_id) throws Exception;
}
