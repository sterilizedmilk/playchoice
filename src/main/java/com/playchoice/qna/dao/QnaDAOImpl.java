package com.playchoice.qna.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playchoice.qna.dto.QnaDTO;

@Repository
public class QnaDAOImpl implements QnaDAO{

	@Autowired
	SqlSessionTemplate session;
	
	final String namespace="com.playchoice.mappers.qnaMapper";
	
	@Override
	public int insertQuset(HashMap<String, Object> res) {
	
		return session.insert(namespace+".insertQuset", res);
	}

	@Override
	public int deleteQna(QnaDTO dto) {
		// TODO Auto-generated method stub
		return session.update(namespace+".deleteQna", dto);
	}

}
