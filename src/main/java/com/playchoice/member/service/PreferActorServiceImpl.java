package com.playchoice.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.member.dao.PreferActorDAO;
import com.playchoice.member.dto.PreferActorDTO;

@Service
public class PreferActorServiceImpl implements PreferActorService {

	@Autowired
	private PreferActorDAO preferActorDao;
	
	// 선호 배우 목록
	@Override
	public List<ActorDTO> preferActorList(int m_code) throws Exception {
		return preferActorDao.preferActorList(m_code);
	}

	// 선호 배우 추가
	@Override
	public void insertPrefer(PreferActorDTO dto) throws Exception {
		preferActorDao.insertPrefer(dto);
	}

	// 선호 배우 삭제
	@Override
	public void deletePrefer(int a_id) throws Exception {
		preferActorDao.deletePrefer(a_id);
	}

	// 선호배우 목록에 동일한 배우가 있는지 검사
	@Override
	public int countPrefer(int m_code, int a_id) throws Exception {
		return preferActorDao.countPrefer(m_code, a_id);
	}

}
