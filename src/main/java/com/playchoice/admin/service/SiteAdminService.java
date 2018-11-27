package com.playchoice.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.admin.dto.AreaDTO;
import com.playchoice.admin.dto.GenreDTO;
import com.playchoice.admin.dto.MemberSearchDTO;
import com.playchoice.member.dto.MemberDTO;
import com.playchoice.play.dto.PlayDTO;

public interface SiteAdminService {

	public List<GenreDTO> genreList();

	public Map<Integer, String> genreMap();

	public int genreInsert(String g_name);

	public int genreUpdate(GenreDTO dto);

	public List<AreaDTO> areaList();

	public Map<Integer, String> areaMap();

	public int areaInsert(String a_name);
	
	public int areaUpdate(AreaDTO dto);

	public int areaDelete(int a_id);

	// 멤버 관련
	public Object memberListAll();
	
	public List<MemberDTO> searchMember(MemberSearchDTO search);

	public MemberDTO getMember(int m_code);

	public int memberUpdate(MemberDTO memberDTO);

	public Object memberDelete(MemberDTO memberDTO);

	public Object memberblack(MemberDTO memberDTO);
	
	// 연극 관련
	public List<PlayDTO> playList();
	
	// 배우 관련
	public Object actorListAll();

	public Object actorUpdate(ActorDTO actorDTO);

	public Object actorDelete(ActorDTO actorDTO);

	int insertActor(HashMap<String, Object> param);


}
