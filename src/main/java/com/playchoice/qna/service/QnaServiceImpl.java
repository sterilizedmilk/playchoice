package com.playchoice.qna.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.qna.dao.QnaDAO;
import com.playchoice.qna.dto.QnaDTO;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	QnaDAO dao;
	
	@Override
	public int insertQuset(HashMap<String, Object> res) {
	
		return dao.insertQuset(res);
	}

	@Override
	public int deleteQna(QnaDTO dto) {
		// TODO Auto-generated method stub
		return dao.deleteQna(dto);
	}

}
