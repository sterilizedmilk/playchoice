package com.playchoice.actor.dao;

import java.util.List;

import com.playchoice.actor.dto.PlayAppearDTO;

public interface PlayAppearDAO {

	// 출연 작품 목록
	public List<PlayAppearDTO> appearList(int a_id) throws Exception;
	
}
