package com.playchoice.schedule.service;

import java.util.List;

import com.playchoice.schedule.dto.ScheduleDTO;

public interface ScheduleService {
	
	public List<ScheduleDTO> getScheduleList(int p_id);
	
	public List<ScheduleDTO> getScheduleListByMonth(int p_id, int year, int month);
	
	public ScheduleDTO getSchedule(int s_id);
	
	public int discountedPrice(ScheduleDTO schedule);
	
	public int ticketLeft(ScheduleDTO schedule);
	
}
