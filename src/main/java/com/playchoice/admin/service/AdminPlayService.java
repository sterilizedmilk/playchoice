package com.playchoice.admin.service;

import java.util.HashMap;
import java.util.List;

import com.playchoice.play.dto.PlayDTO;
import com.playchoice.schedule.dto.ScheduleDTO;

public interface AdminPlayService {
	
	public List<PlayDTO> listAll() throws Exception;
	
	public PlayDTO read(int p_id) throws Exception;
	
//	public void regist(PlayDTO dto) throws Exception;
	public int regist(HashMap<String, Object> param) throws Exception;
	
//	public void modify(PlayDTO dto) throws Exception;
	public int modify(HashMap<String, Object> param) throws Exception;
	
	public void remove(int p_id) throws Exception;
	
	public void flurry(int p_id) throws Exception;
	
	public List<ScheduleDTO> psread(int p_id) throws Exception;
	
	public void psregist(ScheduleDTO sdto) throws Exception;
}
