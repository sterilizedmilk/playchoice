package com.playchoice.play.dao;

import java.util.HashMap;
import java.util.List;

import com.playchoice.admin.dto.AreaDTO;
import com.playchoice.admin.dto.GenreDTO;
import com.playchoice.play.dto.PlayDTO;
import com.playchoice.play.dto.PlayshowDTO;
import com.playchoice.play.dto.SearchPlayDTO;

public interface PlayDAO {
	// 연극 전체 리스트
	public List<PlayDTO> playList();

	// 연극 detail
	public PlayDTO playDetail(int p_id);

	public List<PlayDAO> playSearch(SearchPlayDTO search);

	// 연극 게시물 작성
	public int playAdd(PlayDTO dto);

	// 새 연극 올리기
	public int playPost(int p_id);

	// 끝난 연극 내리기?
	public int playDetach(int p_id);

	public List<Object> viewCal(HashMap<String, Object> param);

	// detail 접근시 schedule 가져오기
	public Object getSchedule(int p_id);

	public Object getReviewSmall(int p_id);

	public Object getReviewScore(int p_id);

	public List<Object> getQnA(int p_id);

	// 오늘,내일 연극
	public List<PlayDTO> playTodayList(String date);

	public Object getPlayRank();

	// 지역 관련 리스트
	public List<AreaDTO> getAreaList();

	// 장르 관련 리스트
	public List<GenreDTO> getGenreList();
}
