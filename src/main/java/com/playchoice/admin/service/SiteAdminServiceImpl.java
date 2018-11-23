package com.playchoice.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.admin.dao.SiteAdminDAO;
import com.playchoice.admin.dto.AreaDTO;
import com.playchoice.admin.dto.GenreDTO;
import com.playchoice.member.dto.MemberDTO;

@Service
public class SiteAdminServiceImpl implements SiteAdminService {

	@Autowired
	private SiteAdminDAO dao;

	@Override
	public List<GenreDTO> genreList() {
		return dao.genreList();
	}

	@Override
	public Map<Integer, String> genreMap() {
		List<GenreDTO> list = dao.genreList();
		Map<Integer, String> map = new HashMap<>();

		for (GenreDTO dto : list)
			map.put(dto.getG_id(), dto.getG_name());

		return map;
	}

	@Override
	public int genreInsert(String g_name) {
		return dao.genreInsert(g_name);
	}

	@Override
	public int genreUpdate(GenreDTO dto) {
		return dao.genreUpdate(dto);
	}

	@Override
	public List<AreaDTO> areaList() {
		return dao.areaList();
	}

	@Override
	public Map<Integer, String> areaMap() {
		List<AreaDTO> list = dao.areaList();
		Map<Integer, String> map = new HashMap<>();

		for (AreaDTO dto : list)
			map.put(dto.getA_id(), dto.getA_name());

		return map;
	}

	@Override
	public int areaInsert(String a_name) {
		return dao.areaInsert(a_name);
	}
	
	@Override
	public int areaUpdate(AreaDTO dto) {
		return dao.areaUpdate(dto);
	}

	@Override
	public int areaDelete(int a_id) {
		// TODO Auto-generated method stub
		return dao.areaDelete(a_id);
	}

	// -----------멤버 관련
	@Override
	public Object memberListAll() {
		// TODO Auto-generated method stub
		return dao.memberManage();
	}

	@Override
	public Object memberUpdate(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return dao.memberUpdate(memberDTO);
	}

	@Override
	public Object memberDelete(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return dao.memberDelete(memberDTO);
	}

	@Override
	public Object memberblack(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return dao.memberBlack(memberDTO);
	}

	@Override
	public Object actorListAll() {
		// TODO Auto-generated method stub
		return dao.actorManage();
	}

	@Override
	public Object actorUpdate(ActorDTO actorDTO) {
		// TODO Auto-generated method stub
		return dao.actorUpdate(actorDTO);
	}

	@Override
	public Object actorDelete(ActorDTO actorDTO) {
		// TODO Auto-generated method stub
		return dao.actorDelete(actorDTO);
	}
}
