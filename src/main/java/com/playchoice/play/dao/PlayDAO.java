package com.playchoice.play.dao;

import java.util.List;

import com.playchoice.play.dto.PlayDTO;
import com.playchoice.play.dto.SearchPlayDTO;

public interface PlayDAO {

	public PlayDAO getPlay(int p_id);

	public List<PlayDAO> searchPlay(SearchPlayDTO search);

	// 연극 게시물 작성
	public int addPlay(PlayDTO dto);

	// 새 연극 올리기
	public int postPlay(int p_id);

	// 끝난 연극 내리기?
	public int detachPlay(int p_id);

}
