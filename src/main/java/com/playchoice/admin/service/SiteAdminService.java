package com.playchoice.admin.service;

import java.util.List;

import com.playchoice.admin.dto.AreaDTO;
import com.playchoice.admin.dto.GenreDTO;

public interface SiteAdminService {
	
	public List<GenreDTO> genreList();

	public int genreInsert(String g_name);

	public int genreDelete(int g_id);

	public List<AreaDTO> areaList();
	
	public int areaInsert(String a_name);

	public int areaDelete(int a_id);
}
