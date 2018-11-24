package com.playchoice.actor.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.actor.dao.ActorDAO;
import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.actor.dto.SearchActorDTO;
import com.playchoice.member.dto.MemberDTO;

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

	//배우 찜하기
	@Override
	public int mypickActor(MemberDTO dto, String a_id) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("m_code",dto.getM_code());
		param.put("a_id", a_id);
		
		return dao.mypickActor(param);
	}

	@Override
	public ActorDTO getActor(int a_id) throws Exception {
		ActorDTO dto = dao.getActor(a_id); 
		return dto;
	}

}
