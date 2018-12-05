package com.playchoice.actor.service;

import java.util.List;

import com.playchoice.actor.dto.PlayAppearDTO;
import com.playchoice.play.dto.PlayDTO;

public interface PlayAppearService {

	// 출연 작품 목록
	public List<PlayDTO> appearList(int a_id) throws Exception;
	
	// 연극별 배우 삭제
//	public void padelete(int a_id) throws Exception;
	public void padelete(PlayAppearDTO padto) throws Exception;
	
}
