package com.playchoice.admin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.admin.dao.AdminPlayDAO;
import com.playchoice.play.dto.PlayDTO;

@Service
public class AdminPlayServiceImpl implements AdminPlayService{
	
	@Autowired
	private AdminPlayDAO dao;
	
	@Override
	public List<PlayDTO> listAll() throws Exception {
		System.out.println("list service start");
		return dao.listAll();
	}

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
	@Override
	public int modify(HashMap<String, Object> param) throws Exception {
		System.out.println("modify service start");
		return dao.update(param);
	}

	@Override
	public void remove(int p_id) throws Exception {
		System.out.println("remove service start");
		dao.delete(p_id);
	}

	@Override
	public void flurry(int p_id) throws Exception {
		System.out.println("flurry service start");
		dao.flurry(p_id);
	}

	@Override
	public void modify(PlayDTO dto) throws Exception {
		// TODO Auto-generated method stub
		
	}
	

}
