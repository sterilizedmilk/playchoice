package com.playchoice.actor.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.actor.dao.ActorDAO;
import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.actor.dto.SearchActorDTO;

@Service
public class ActorServiceImpl implements ActorService {
	
	@Autowired
	ActorDAO dao;
	
	@Override
	public List<ActorDTO> listActor(String keyword) {
		//keyword의 유무로 SQL문이 달라져서 DAO 메소드를 나눠놨음
		if(keyword == null || keyword.equals("")) {
			return dao.listActor();
		}else {
			return dao.seachActor(keyword);
		}
	}

	@Override
	public int insertActor(HashMap<String, Object> param) {
		//생년월일이 null값이면 SQL 등록 오류가 나서 null일시 기본값 넣어줌
		if(param.get("a_birth") == null || param.get("a_birth").equals(""))
			param.put("a_birth", "1900-01-01");
		return dao.insertActor(param);
	}

}
