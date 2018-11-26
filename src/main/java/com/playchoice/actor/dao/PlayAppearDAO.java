package com.playchoice.actor.dao;

import java.util.List;

import com.playchoice.play.dto.PlayDTO;

public interface PlayAppearDAO {

	// 출연 작품 목록
	public List<PlayDTO> appearList(int a_id) throws Exception;
	
}
