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
	
	//등록하기
	@Override
	public int insertQuset(HashMap<String, Object> res) {
		
		//줄바꿈 처리
		if(res.get("q_content") instanceof String) {
			String test = (String)res.get("q_content");
			test = test.replaceAll("\n", "<br>");
			
			res.put("q_content", test);
		}
		
		return dao.insertQuset(res);
	}

	//삭제하기
	@Override
	public int deleteQna(QnaDTO dto) {
		// TODO Auto-generated method stub
		return dao.deleteQna(dto);
	}

}
