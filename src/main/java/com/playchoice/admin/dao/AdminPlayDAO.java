package com.playchoice.admin.dao;

import java.util.List;

import com.playchoice.actor.dto.PlayAppearDTO;
import com.playchoice.common.PageDTO;
import com.playchoice.member.dto.MemberDTO;
import com.playchoice.play.dto.PlayDTO;
import com.playchoice.qna.dto.QnaDTO;
import com.playchoice.schedule.dto.ScheduleDTO;

public interface AdminPlayDAO {
	
	public List<PlayDTO> listAll(MemberDTO user) throws Exception;
	
	public PlayDTO read(int p_id) throws Exception;
	
	public void create(PlayDTO dto) throws Exception;
//	public int create(HashMap<String, Object> param) throws Exception;
	
	public void update(PlayDTO dto) throws Exception;
//	public int update(HashMap<String, Object> param) throws Exception;
	
	public void delete(int p_id) throws Exception;
	
	public void flurry(int p_id) throws Exception;
	
	public void psmodify(ScheduleDTO sdto) throws Exception;
	
	//일정목록
	public List<ScheduleDTO> psread(int p_id) throws Exception;
	
	//일정목록 페이징 처리
	public List<ScheduleDTO> psreadPaging(int p_id, PageDTO dto) throws Exception;
	
	//총 목록수
	public int psreadCount(int p_id) throws Exception;
	// 연극배우 총목록수
	public int palistCount(int p_id) throws Exception;
	
	// 연극배우별 확인
	public int pacount(int p_id, int a_id) throws Exception;
		
	public void pscreate(ScheduleDTO sdto) throws Exception;
	
	public List<QnaDTO> getQna(int m_code);
	
	public List<QnaDTO> getDetail(QnaDTO dto);
	
	public int replyWri(QnaDTO dto);
	
	public int replyModi(QnaDTO dto);
	
	public List<PlayDTO> myPlay(int m_code);
	
	public List<QnaDTO> getQnaAsPlay(int p_id);
}
