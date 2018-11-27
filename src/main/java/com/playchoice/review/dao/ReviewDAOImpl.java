package com.playchoice.review.dao;

import java.util.List;

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
	
	
	
}
