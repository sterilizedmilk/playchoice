package com.playchoice.schedule.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playchoice.schedule.dto.ScheduleDTO;

@Repository
public class ScheduleDAOImpl implements ScheduleDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace = "com.playchoice.mappers.scheduleMapper";
	
	@Override
	public List<ScheduleDTO> getScheduleList(int p_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".viewCal", p_id);
	}
	
	@Override
	public ScheduleDTO getSchedule(int s_id) {
		return sqlSession.selectOne(namespace + ".getSchedule", s_id);
	}

	@Override
	public int ticketSold(int s_id) {
		return sqlSession.selectOne(namespace + ".tikectLeft", s_id);
	}
}
