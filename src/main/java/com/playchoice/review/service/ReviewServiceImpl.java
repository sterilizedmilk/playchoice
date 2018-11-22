package com.playchoice.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.review.dao.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	ReviewDAO dao;
	
	@Override
	public List<Object> getTotalReview(int p_id) {
		// TODO Auto-generated method stub
		return dao.getTotalReview(p_id);
	}

}
