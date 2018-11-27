package com.playchoice.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.payment.dto.PaymentDTO;
import com.playchoice.review.dao.ReviewDAO;
import com.playchoice.review.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	ReviewDAO dao;
	
	@Override
	public List<Object> getTotalReview(int p_id) {
		// TODO Auto-generated method stub
		return dao.getTotalReview(p_id);
	}
	
	//(리뷰작성시)배우정보 가져오기
	@Override
	public List<ActorDTO> actorInfo(PaymentDTO dto) {
		// TODO Auto-generated method stub
		return dao.actorInfo(dto);
	}

	@Override
	public int regReview(ReviewDTO dto) {
		// TODO Auto-generated method stub
		return dao.regReview(dto);
	}

}
