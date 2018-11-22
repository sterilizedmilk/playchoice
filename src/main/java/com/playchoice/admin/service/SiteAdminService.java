package com.playchoice.admin.service;

import java.util.List;
import java.util.Map;

import com.playchoice.admin.dto.AreaDTO;
import com.playchoice.admin.dto.GenreDTO;

public interface SiteAdminService {

	public List<GenreDTO> genreList();
	
	public Map<Integer, String> genreMap();

	public int genreInsert(String g_name);

	public int genreDelete(int g_id);

	public List<AreaDTO> areaList();
	
	public Map<Integer, String> areaMap();

	public int areaInsert(String a_name);

	public int areaDelete(int a_id);

	public Object memberListAll() throws Exception;
}
