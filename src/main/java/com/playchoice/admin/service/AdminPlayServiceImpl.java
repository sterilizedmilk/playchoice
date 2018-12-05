package com.playchoice.admin.service;

import java.util.HashMap;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.playchoice.actor.dao.PlayAppearDAO;
import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.actor.dto.PlayAppearDTO;
import com.playchoice.admin.dao.AdminPlayDAO;
import com.playchoice.common.PageDTO;
import com.playchoice.member.dto.MemberDTO;
import com.playchoice.play.dto.PlayDTO;
import com.playchoice.qna.dto.QnaDTO;
import com.playchoice.schedule.dto.ScheduleDTO;

@Service
public class AdminPlayServiceImpl implements AdminPlayService{
	
	@Autowired
	private AdminPlayDAO dao;
	
	@Autowired
	private PlayAppearDAO padao;
	
		
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
		
		PlayDTO dto = dao.read(p_id);
		
		//줄바꿈 처리
		String res = dto.getP_info().replaceAll("<br>", "\n");
		dto.setP_info(res);
		String res2 = dto.getP_refund_policy().replaceAll("<br>", "\n");
		dto.setP_refund_policy(res2);
		
		return dto;
	}
	
	//연극 생성
	@Override
	public void regist(PlayDTO dto) throws Exception {
		System.out.println("insert service start");
		//줄바꿈 처리
		String res = dto.getP_info().replaceAll("\n", "<br>");
		dto.setP_info(res);
		String res2 = dto.getP_refund_policy().replaceAll("\n", "<br>");
		dto.setP_refund_policy(res2);
		
		dao.create(dto);
	}

	//연극 내용 수정
	@Override
	public void modify(PlayDTO dto) throws Exception {
		System.out.println("modify service start");
		//줄바꿈 처리
		String res = dto.getP_info().replaceAll("\n", "<br>");
		dto.setP_info(res);
		String res2 = dto.getP_refund_policy().replaceAll("\n", "<br>");
		dto.setP_refund_policy(res2);
		
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
	
	//연극 일정 수정
	@Override
	public void psmodify(ScheduleDTO sdto) throws Exception {
		System.out.println("psmodify service start");
		dao.psmodify(sdto);
	}	
	
	//연극 일정 리스트 보기
	@Override
	public List<ScheduleDTO> psread(int p_id) throws Exception {
		System.out.println("psread service start");
		return dao.psread(p_id);
	}
	//연극 일정 리스트 페이징
	@Override
	public List<ScheduleDTO> psreadPaging(int p_id, PageDTO dto) throws Exception {
		return dao.psreadPaging(p_id, dto);
	}
	//총 목록 수
	@Override
	public int psreadCount(int p_id) throws Exception {
		return dao.psreadCount(p_id);
	}
	//연극별 배우 총리스트
	@Override
	public int palistCount(int p_id) throws Exception {
		return dao.palistCount(p_id);
	}
	//연극별 배우 선택
	@Override
	public int palistinsert(PlayAppearDTO padto) throws Exception {
		return padao.painsert(padto);
	}
	//연극별 배우 리스트 페이징
	@Override
	public List<ActorDTO> palistPaging(int p_id, PageDTO dto) throws Exception {
		return padao.palistPaging(p_id, dto);
	}
	//연극별 배우 카운팅
	@Override
	public int pacount(int p_id, int a_id) throws Exception {
		return dao.pacount(p_id, a_id);
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
