package com.playchoice.actor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.actor.dao.PlayAppearDAO;
import com.playchoice.actor.dto.PlayAppearDTO;

@Service
public class PlayAppearServiceImpl implements PlayAppearService {

	@Autowired
	private PlayAppearDAO playAppearDao;
	
	@Override
	public List<PlayAppearDTO> appearList(int a_id) throws Exception {
		return playAppearDao.appearList(a_id);
	}

}
