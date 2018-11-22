package com.playchoice.review.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	
	
}
