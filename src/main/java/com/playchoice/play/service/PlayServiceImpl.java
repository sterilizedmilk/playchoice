package com.playchoice.play.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.play.dao.PlayDAO;
import com.playchoice.play.dao.PlayDAOImpl;
import com.playchoice.play.dto.PlayDTO;
import com.playchoice.play.dto.PlayshowDTO;

@Service
public class PlayServiceImpl implements PlayService {

	@Autowired
	private PlayDAOImpl playDao;

	@Override
	public List<PlayDTO> playList() throws Exception {
		System.out.println("servicelist start");
		return playDao.playList();
	}

	@Override
	public PlayDTO playDetail(int p_id) throws Exception {
		System.out.println("servicedetail start");
		return playDao.playDetail(p_id);
	}

	@Override
	public List<Object> viewCal(HashMap<String, Object> param) {
		System.out.println("viewCal 서비스왓다");
		return playDao.viewCal(param);
	}
	
	@Override
	public Object getSchedule(int p_id) {
		
		return playDao.getSchedule(p_id);

	}
	
	@Override
	public Object getReviewSmall(int p_id) {
		
		return playDao.getReviewSmall(p_id);
	}

	@Override
	public Object getReviewScore(int p_id) {
		// TODO Auto-generated method stub
		return playDao.getReviewScore(p_id);
	}

}
