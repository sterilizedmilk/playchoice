package com.playchoice.play.dao;

import java.util.HashMap;
import java.util.List;

import com.playchoice.play.dto.PlayDTO;
import com.playchoice.play.dto.PlayshowDTO;
import com.playchoice.play.dto.SearchPlayDTO;

public interface PlayDAO {
	//연극 전체 리스트
	public List<PlayDTO> playList();
	//연극 detail
	public PlayDTO playDetail(int p_id);

	public List<PlayDAO> playSearch(SearchPlayDTO search);

	// 연극 게시물 작성
	public int playAdd(PlayDTO dto);

	// 새 연극 올리기
	public int playPost(int p_id);

	// 끝난 연극 내리기?
	public int playDetach(int p_id);
	
	public List<Object> viewCal(HashMap<String,Object> param);
	
	public Object getSchedule(int p_id);
	
	public Object getReview(int p_id);
	

}
