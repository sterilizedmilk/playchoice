package com.playchoice.play.service;

import java.util.HashMap;
import java.util.List;

import com.playchoice.play.dto.PlayDTO;
import com.playchoice.play.dto.PlayshowDTO;


public interface PlayService {
		// 연극 목록
		public List<PlayDTO> playList() throws Exception;
		
		// 연극 상세
		public PlayDTO playDetail(int p_id) throws Exception;

		public List<Object> viewCal(HashMap<String,Object> param);
}
