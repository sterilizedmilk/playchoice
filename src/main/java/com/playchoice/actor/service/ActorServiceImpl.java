package com.playchoice.actor.service;

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

}
