package com.playchoice.actor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.actor.dao.PlayAppearDAO;
import com.playchoice.play.dto.PlayDTO;

@Service
public class PlayAppearServiceImpl implements PlayAppearService {

	@Autowired
	private PlayAppearDAO playAppearDao;
	
	@Override
	public List<PlayDTO> appearList(int a_id) throws Exception {
		return playAppearDao.appearList(a_id);
	}

}
