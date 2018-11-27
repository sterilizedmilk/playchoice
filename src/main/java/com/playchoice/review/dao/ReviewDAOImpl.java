package com.playchoice.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.payment.dto.PaymentDTO;
import com.playchoice.review.dto.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	SqlSessionTemplate session;
	
	final String namespace = "com.playchoice.mappers.reviewMapper";

	@Override
	public List<Object> getTotalReview(int p_id) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".getTotalReview", p_id);
	}

	@Override
	public List<ActorDTO> actorInfo(PaymentDTO dto) {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".actorInfo", dto);
	}

	@Override
	public int regReview(ReviewDTO dto) {
		// TODO Auto-generated method stub
		return session.insert(namespace+".regReview", dto);
	}

	@Override
	public ReviewDTO getReview(int m_code, int s_id) {
		Map<String, Integer> map = new HashMap<>();
		map.put("m_code", m_code);
		map.put("s_id", s_id);
		return session.selectOne(namespace + ".getReview", map);
	}

	@Override
	public boolean isReviewExist(int m_code, int s_id) {
		Map<String, Integer> map = new HashMap<>();
		map.put("m_code", m_code);
		map.put("s_id", s_id);
		return (Integer) session.selectOne(namespace + ".isReviewExist", map) == 1;
	}
	
}
