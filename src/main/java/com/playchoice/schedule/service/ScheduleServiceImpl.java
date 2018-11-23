package com.playchoice.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.schedule.dao.ScheduleDAO;
import com.playchoice.schedule.dto.ScheduleDTO;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	ScheduleDAO dao;

	@Override
	public List<ScheduleDTO> getScheduleList(int p_id) {
		return dao.getScheduleList(p_id);
	}
	
	@Override
	public ScheduleDTO getSchedule(int s_id) {
		return dao.getSchedule(s_id);
	}
	
	public int discountedPrice(ScheduleDTO schedule) {
		int price = schedule.getS_price();

		long showDay = schedule.getS_time().getTime() / 86400000;
		long today = System.currentTimeMillis() / 86400000;
		int diff = (int) (showDay - today); // 상영일 - 오늘

		if (diff == 0) { // 70%
			price *= 70;
			price /= 100;
		} else if (diff == 1) { // 80%
			price *= 80;
			price /= 100;
		}

		return price;
	}
	
}
