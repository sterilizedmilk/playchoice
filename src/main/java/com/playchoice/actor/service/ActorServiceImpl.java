package com.playchoice.actor.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.actor.dao.ActorDAO;
import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.member.dto.MemberDTO;

@Service
public class ActorServiceImpl implements ActorService {
	
	@Autowired
	ActorDAO dao;
	
	@Override
	public List<ActorDTO> listActor(String keyword) {
		// keyword의 유무로 SQL문이 달라져서 DAO 메소드를 나눠놨음
		if(keyword == null || keyword.equals("")) {
			return dao.listActor();
		}else {
			return dao.seachActor(keyword);
		}
	}

	// 배우 찜하기
	@Override
	public int mypickActor(MemberDTO dto, String a_id) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("m_code",dto.getM_code());
		param.put("a_id", a_id);
		
		return dao.mypickActor(param);
	}

	// 배우 아이디 가져오기
	@Override
	public ActorDTO getActor(int a_id) throws Exception {
		ActorDTO dto = dao.getActor(a_id); 
		return dto;
	}

	// 주연배우1 평점 가져오기
	@Override
	public double getReviewScore(int a_id) throws Exception {
		Map<String, Integer> map1 = dao.getReviewScore1(a_id);
		Map<String, Integer> map2 = dao.getReviewScore2(a_id);
		System.out.println(map1);
		System.out.println(map2);

		int sum =  ((Number) map1.get("sum")).intValue() + ((Number) map2.get("sum")).intValue();
		if (sum == 0)
			return 0.0;
		int count = ((Number) map1.get("count")).intValue() + ((Number) map2.get("count")).intValue();
		double avg = (double) sum / count;
		return Math.round(avg * 10) / 10;
	}
}
