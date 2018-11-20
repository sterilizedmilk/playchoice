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

}
