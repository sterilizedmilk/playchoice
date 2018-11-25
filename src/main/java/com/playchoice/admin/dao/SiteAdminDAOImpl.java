package com.playchoice.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.admin.dto.AreaDTO;
import com.playchoice.admin.dto.GenreDTO;
import com.playchoice.member.dto.MemberDTO;
import com.playchoice.play.dto.SearchPlayDTO;

@Repository
public class SiteAdminDAOImpl implements SiteAdminDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String namespace = "com.playchoice.mappers.siteAdminMapper";

	@Override
	public List<MemberDTO> memberList(SearchPlayDTO search) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int black(int m_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int unBlack(int m_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int approvePlayAdmin(int m_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int dismissPlayAdmin(int m_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int settleMoney() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<GenreDTO> genreList() {
		return sqlSession.selectList(namespace + ".genreList");
	}

	@Override
	public int genreInsert(String g_name) {
		return sqlSession.insert(namespace + ".genreInsert", g_name);
	}

	@Override
	public int genreUpdate(GenreDTO dto) {
		return sqlSession.update(namespace + ".genreUpdate", dto);
	}

	@Override
	public List<AreaDTO> areaList() {
		return sqlSession.selectList(namespace + ".areaList");
	}

	@Override
	public int areaInsert(String a_name) {
		return sqlSession.insert(namespace + ".areaInsert", a_name);
	}
	
	@Override
	public int areaUpdate(AreaDTO dto) {
		return sqlSession.update(namespace + ".areaUpdate", dto);
	}

	@Override
	public int areaDelete(int a_id) {
		return sqlSession.delete(namespace + ".areaDelete", a_id);
	}

	// -----------------멤버 관련 -----------------
	@Override
	public Object memberManage() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".memberList");
	}

	@Override
	public MemberDTO getMember(int m_code) {
		return sqlSession.selectOne(namespace + ".getMember", m_code);
	}

	@Override
	public int memberUpdate(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		System.out.println("memberUpdate-------" + memberDTO);
		return sqlSession.update(namespace + ".memberUpdate", memberDTO);
	}

	@Override
	public Object memberDelete(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".memberDelete", memberDTO);
	}

	@Override
	public Object memberBlack(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".memberBlack", memberDTO);
	}

	// -----------------배우 관련 -----------------
	@Override
	public Object actorManage() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace + ".actorList");
	}

	@Override
	public Object actorUpdate(ActorDTO actorDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".actorUpdate", actorDTO);
	}

	@Override
	public Object actorDelete(ActorDTO actorDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + ".actorDelete", actorDTO);
	}
	
	//배우등록
	@Override
	public int insertActor(HashMap<String, Object> param) {
	
		return sqlSession.insert(namespace+".insertActor", param);
	}

}
