package com.playchoice.actor.service;

import java.util.List;

import com.playchoice.play.dto.PlayDTO;

public interface PlayAppearService {

	// 출연 작품 목록
	public List<PlayDTO> appearList(int a_id) throws Exception;
	
}
