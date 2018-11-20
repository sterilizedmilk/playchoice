package com.playchoice.schedule.controller;

import java.sql.Timestamp;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.playchoice.schedule.dto.ScheduleDTO;

@Controller
@RequestMapping("show")
public class ScheduleController {

	@SuppressWarnings("deprecation")
	@RequestMapping("updateCalendar")
	public @ResponseBody List<List<ScheduleDTO>> updateCalendarController(
									@RequestParam("year") int year,
									@RequestParam("month") int month) throws Exception {
		
		YearMonth ym = YearMonth.of(year, month);
		int lengthOfMonth = ym.lengthOfMonth();
		
		List<List<ScheduleDTO>> calendarInfo = new ArrayList<List<ScheduleDTO>>(lengthOfMonth);
		
		for (int i = 0; i < lengthOfMonth; ++i)
			calendarInfo.add(new ArrayList<ScheduleDTO>());
		
		
		// TODO: 임시, db에서 가져와야함
		ScheduleDTO exam = new ScheduleDTO();
		exam.setA_id1(1);
		exam.setA_id2(2);
		exam.setA_name1("홍길동");
		exam.setA_name2("신사임당");
		exam.setS_time(new Timestamp((new Date()).getTime()));
		
		
		calendarInfo.get(exam.getS_time().getMonth()).add(exam);
		
		return calendarInfo;
	}
	
	@RequestMapping(value="bastket", method=RequestMethod.POST)
	String shoppingBastket() {
		
		return "";
	}
	
	
}
