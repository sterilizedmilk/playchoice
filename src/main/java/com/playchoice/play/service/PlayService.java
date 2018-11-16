package com.playchoice.play.service;

import java.util.List;

import com.playchoice.play.dto.PlayDTO;


public interface PlayService {
		// 연극 목록
		public List<PlayDTO> playList() throws Exception;
		
		// 연극 상세
		public PlayDTO playDetail(int p_id) throws Exception;
}
