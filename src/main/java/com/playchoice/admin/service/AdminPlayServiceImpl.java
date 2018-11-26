package com.playchoice.admin.service;

import java.util.HashMap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.admin.dao.AdminPlayDAO;
import com.playchoice.member.dto.MemberDTO;
import com.playchoice.play.dto.PlayDTO;
import com.playchoice.qna.dto.QnaDTO;
import com.playchoice.schedule.dto.ScheduleDTO;

@Service
public class AdminPlayServiceImpl implements AdminPlayService{
	
	@Autowired
	private AdminPlayDAO dao;
	
		
	//연극 리스트 보기
	@Override
	public List<PlayDTO> listAll(MemberDTO user) throws Exception {
		System.out.println("list service start");
		return dao.listAll(user);
	}
	//연극 내용 자세히 보기
	@Override
	public PlayDTO read(int p_id) throws Exception {
		System.out.println("read service start");
		return dao.read(p_id);
	}
	
	//연극 생성
	@Override
	public void regist(PlayDTO dto) throws Exception {
		System.out.println("insert service start");
		dao.create(dto);
	}

	//연극 내용 수정
	@Override
	public void modify(PlayDTO dto) throws Exception {
		System.out.println("modify service start");
		dao.update(dto);
	}	

	//연극 삭제 -> status=0으로 변경
	@Override
	public void remove(int p_id) throws Exception {
		System.out.println("remove service start");
		dao.delete(p_id);
	}
	//연극 게시 -> status=1로 변경
	@Override
	public void flurry(int p_id) throws Exception {
		System.out.println("flurry service start");
		dao.flurry(p_id);
	}

	
	//연극 일정 리스트 보기
	@Override
	public List<ScheduleDTO> psread(int p_id) throws Exception {
		System.out.println("psread service start");
		return dao.psread(p_id);
	}

	//연극 일정 생성
	@Override
	public void psregist(ScheduleDTO sdto) throws Exception {
		System.out.println("psmodify service start");
		dao.pscreate(sdto);
	}
	
	//QnA 가져오기
	@Override
	public List<QnaDTO> getQna(int m_code) {
		// TODO Auto-generated method stub
		return dao.getQna(m_code);
	}
	@Override
	public List<QnaDTO> getDetail(QnaDTO dto) {
		// TODO Auto-generated method stub
		return dao.getDetail(dto);
	}
	@Override
	public int replyWri(QnaDTO dto) {
		// TODO Auto-generated method stub
		return dao.replyWri(dto);
	}
	@Override
	public int replyModi(QnaDTO dto) {
		// TODO Auto-generated method stub
		return dao.replyModi(dto);
	}
	@Override
	public List<PlayDTO> myPlay(int m_code) {
		// TODO Auto-generated method stub
		return dao.myPlay(m_code);
	}
	@Override
	public List<QnaDTO> getQnaAsPlay(int p_id) {
		// TODO Auto-generated method stub
		return dao.getQnaAsPlay(p_id);
	}
}
