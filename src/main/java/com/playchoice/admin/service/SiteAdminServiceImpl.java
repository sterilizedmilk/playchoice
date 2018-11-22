package com.playchoice.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.admin.dao.SiteAdminDAO;
import com.playchoice.admin.dto.AreaDTO;
import com.playchoice.admin.dto.GenreDTO;

@Service
public class SiteAdminServiceImpl implements SiteAdminService {

	@Autowired
	private SiteAdminDAO dao;

	@Override
	public List<GenreDTO> genreList() {
		return dao.genreList();
	}

	@Override
	public int genreInsert(String g_name) {
		return dao.genreInsert(g_name);
	}

	@Override
	public int genreDelete(int g_id) {
		return dao.genreDelete(g_id);
	}

	@Override
	public List<AreaDTO> areaList() {
		return dao.areaList();
	}

	@Override
	public int areaInsert(String a_name) {
		return dao.areaInsert(a_name);
	}

	@Override
	public int areaDelete(int a_id) {
		// TODO Auto-generated method stub
		return dao.areaDelete(a_id);
	}

	@Override
	public Object memberListAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.memberManage();
	}
}
