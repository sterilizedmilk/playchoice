package com.playchoice.admin.dao;

import java.util.List;

import com.playchoice.play.dto.PlayDTO;
import com.playchoice.qna.dto.QnaDTO;
import com.playchoice.schedule.dto.ScheduleDTO;

public interface AdminPlayDAO {
	
	public List<PlayDTO> listAll() throws Exception;
	
	public PlayDTO read(int p_id) throws Exception;
	
	public void create(PlayDTO dto) throws Exception;
//	public int create(HashMap<String, Object> param) throws Exception;
	
	public void update(PlayDTO dto) throws Exception;
//	public int update(HashMap<String, Object> param) throws Exception;
	
	public void delete(int p_id) throws Exception;
	
	public void flurry(int p_id) throws Exception;
	
	public List<ScheduleDTO> psread(int p_id) throws Exception;
	
	public void pscreate(ScheduleDTO sdto) throws Exception;
	
	public List<QnaDTO> getQna(int m_code);
}
