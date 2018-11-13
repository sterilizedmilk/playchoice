package com.playchoice.play.dao;

import java.util.List;

import com.playchoice.play.dto.PlayDTO;
import com.playchoice.play.dto.SearchPlayDTO;

public interface PlayDAO {

	public PlayDAO getPlay(int p_id);
	public List<PlayDAO> SearchList(SearchPlayDTO search);
	public int addPlay(PlayDTO dto);
	public int postPlay(int p_id);
	public int detachPlay(int p_id);

}
