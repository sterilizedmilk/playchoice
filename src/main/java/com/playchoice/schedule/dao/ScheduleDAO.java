package com.playchoice.schedule.dao;

import java.util.List;

import com.playchoice.schedule.dto.ScheduleDTO;

public interface ScheduleDAO {
	
	public List<ScheduleDTO> getScheduleList(int p_id);
	
	public ScheduleDTO getSchedule(int s_id);
	
}
