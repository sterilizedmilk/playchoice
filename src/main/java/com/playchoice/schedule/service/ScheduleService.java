package com.playchoice.schedule.service;

import java.util.List;

import com.playchoice.schedule.dto.ScheduleDTO;

public interface ScheduleService {
	
	public List<ScheduleDTO> getScheduleList(int p_id);
	
	public ScheduleDTO getSchedule(int s_id);
	
	public int discountedPrice(ScheduleDTO schedule);
	
	public int ticketLeft(ScheduleDTO schedule);
	
}
