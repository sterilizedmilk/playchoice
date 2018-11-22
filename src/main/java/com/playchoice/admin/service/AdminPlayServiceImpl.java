package com.playchoice.admin.service;

import java.util.HashMap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.admin.dao.AdminPlayDAO;
import com.playchoice.play.dto.PlayDTO;
import com.playchoice.schedule.dto.ScheduleDTO;

@Service
public class AdminPlayServiceImpl implements AdminPlayService{
	
	@Autowired
	private AdminPlayDAO dao;
		
	//연극 리스트 보기
	@Override
	public List<PlayDTO> listAll() throws Exception {
		System.out.println("list service start");
		return dao.listAll();
	}
	//연극 내용 자세히 보기
	@Override
	public PlayDTO read(int p_id) throws Exception {
		System.out.println("read service start");
		return dao.read(p_id);
	}

//	@Override
//	public void regist(PlayDTO dto) throws Exception {
//		System.out.println("insert service start");
//		dao.create(dto);
//	}
	//연극 생성
	@Override
	public int regist(HashMap<String, Object> param) throws Exception {
		System.out.println("insert service start");
		return dao.create(param);
	}
	
//	@Override
//	public void modify(PlayDTO dto) throws Exception {
//		System.out.println("modify service start");
//		dao.update(dto);
//	}
	//연극 내용 수정
	@Override
	public int modify(HashMap<String, Object> param) throws Exception {
		System.out.println("modify service start");
		return dao.update(param);
	}
	//연극 삭제 -> status=0으로 변경
	@Override
	public void remove(int p_id) throws Exception {
		System.out.println("remove service start");
		dao.delete(p_id);
	}
	//연극 게시 -> status=1로 변경
	@Override
	public void flurry(int p_id) throws Exception {
		System.out.println("flurry service start");
		dao.flurry(p_id);
	}

	
	//연극 일정 리스트 보기
	@Override
	public List<ScheduleDTO> psread(int p_id) throws Exception {
		System.out.println("psread service start");
		return dao.psread(p_id);
	}

	//연극 일정 생성
	@Override
	public void psregist(ScheduleDTO sdto) throws Exception {
		System.out.println("psmodify service start");
		dao.pscreate(sdto);
	}
}
