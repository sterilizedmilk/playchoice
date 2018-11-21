package com.playchoice.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playchoice.play.dto.PlayDTO;

@Repository
public class AdminPlayDAOImpl implements AdminPlayDAO{
	
	@Autowired
	private SqlSessionTemplate session;
	private static String namespace = "com.playchoice.mappers.adminplayMapper";
	
	@Override
	public List<PlayDTO> listAll() throws Exception {
		System.out.println("list dao start");
		return session.selectList(namespace +".listAll");
	}

	@Override
	public PlayDTO read(int p_id) throws Exception {
		System.out.println("read dao start");
		return session.selectOne(namespace + ".read",p_id);
	}

//	@Override
//	public void create(PlayDTO dto) throws Exception {
//		System.out.println("create dao start"+dto);
//		session.insert(namespace + ".create", dto);
//	}
	@Override
	public int create(HashMap<String, Object> param) throws Exception {
		System.out.println("create dao start"+ param);
		return session.insert(namespace+".create", param);
	}

//	@Override
//	public void update(PlayDTO dto) throws Exception {
//		System.out.println("update read dao start");
//		session.update(namespace + ".update", dto);
//	}
	@Override
	public int update(HashMap<String, Object> param) throws Exception {
		System.out.println("update read dao start" + param);
		return session.update(namespace + ".update", param);
	}

	@Override
	public void delete(int p_id) throws Exception {
		System.out.println("delete dao start");
		session.update(namespace + ".delete", p_id);
	}
	
	@Override
	public void flurry(int p_id) throws Exception {
		System.out.println("flurry dao start");
		session.update(namespace + ".flurry", p_id);		
	}



}
