package com.playchoice.admin.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.playchoice.member.dto.MemberDTO;
import com.playchoice.play.dto.PlayDTO;
import com.playchoice.qna.dto.QnaDTO;
import com.playchoice.schedule.dto.ScheduleDTO;

@Repository
public class AdminPlayDAOImpl implements AdminPlayDAO{
	
	@Autowired
	private SqlSessionTemplate session;
	private static String namespace = "com.playchoice.mappers.adminplayMapper";
	private static String namespace2 = "com.playchoice.mappers.qnaMapper"; //Qna매퍼
	
	//연극 리스트 보기
	@Override
	public List<PlayDTO> listAll(MemberDTO user) throws Exception {
		System.out.println("list dao start");
		return session.selectList(namespace +".listAll", user);
	}

	//연극 자세히 보기
	@Override
	public PlayDTO read(int p_id) throws Exception {
		System.out.println("read dao start");
		return session.selectOne(namespace + ".read",p_id);
	}
	// 연극 생성
	@Override
	public void create(PlayDTO dto) throws Exception {
		System.out.println("create dao start"+dto);
		session.insert(namespace + ".create", dto);
	}	
	
	//연극 내용 변경
	@Override
	public void update(PlayDTO dto) throws Exception {
		System.out.println("update read dao start");
		session.update(namespace + ".update", dto);
	}	

	//연극 삭제-> status=0으로 변경
	@Override
	public void delete(int p_id) throws Exception {
		System.out.println("delete dao start");
		session.update(namespace + ".delete", p_id);
	}
	
	//연극 게시 -> status=1로 변경
	@Override
	public void flurry(int p_id) throws Exception {
		System.out.println("flurry dao start");
		session.update(namespace + ".flurry", p_id);		
	}
	
	//연극 일정 리스트 보기
	@Override
	public List<ScheduleDTO> psread(int p_id) throws Exception {
		System.out.println("psread dao start");
//		return session.selectOne(namespace + ".psread",p_id);
		return session.selectList(namespace + ".psread", p_id);
	}
	
	//연극 일정 생성
	@Override
	public void pscreate(ScheduleDTO sdto) throws Exception {
		System.out.println("create dao start"+sdto);
		session.insert(namespace + ".pscreate", sdto);
	}
	
	//QnA 가져오기
	@Override
	public List<QnaDTO> getQna(int m_code) {
		// TODO Auto-generated method stub
		return session.selectList(namespace2+".getQna", m_code);
	}

	@Override
	public List<QnaDTO> getDetail(QnaDTO dto) {
		// TODO Auto-generated method stub
		return session.selectList(namespace2+".getDetail", dto);
	}

	@Override
	public int replyWri(QnaDTO dto) {
		// TODO Auto-generated method stub
		return session.insert(namespace2+".replyWri",dto);
	}

	@Override
	public int replyModi(QnaDTO dto) {
		// TODO Auto-generated method stub
		return session.update(namespace2+".replyModi",dto);
	}

}
