package com.playchoice.admin.dao;

import java.util.HashMap;
import java.util.List;

import com.playchoice.play.dto.PlayDTO;

public interface AdminPlayDAO {
	
	public List<PlayDTO> listAll() throws Exception;
	
	public PlayDTO read(int p_id) throws Exception;
	
//	public void create(PlayDTO dto) throws Exception;
	public int create(HashMap<String, Object> param) throws Exception;
	
//	public void update(PlayDTO dto) throws Exception;
	public int update(HashMap<String, Object> param) throws Exception;
	
	public void delete(int p_id) throws Exception;
	
	public void flurry(int p_id) throws Exception;
}
