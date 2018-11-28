package com.playchoice.admin.service;

import java.util.List;

import com.playchoice.common.PageDTO;
import com.playchoice.member.dto.MemberDTO;
import com.playchoice.play.dto.PlayDTO;
import com.playchoice.qna.dto.QnaDTO;
import com.playchoice.schedule.dto.ScheduleDTO;

public interface AdminPlayService {
	
	public List<PlayDTO> listAll(MemberDTO user) throws Exception;
	
	public PlayDTO read(int p_id) throws Exception;
	
	public void regist(PlayDTO dto) throws Exception;
	
	public void modify(PlayDTO dto) throws Exception;
	
	public void remove(int p_id) throws Exception;
	
	public void flurry(int p_id) throws Exception;
	
	public void psmodify(ScheduleDTO sdto) throws Exception;	
	
	public List<ScheduleDTO> psread(int p_id) throws Exception;
	//연극 일정 페이징
	public List<ScheduleDTO> psreadPaging(int p_id, PageDTO dto) throws Exception;
	//총 목록 수
	public int psreadCount(int p_id) throws Exception;
	
	public void psregist(ScheduleDTO sdto) throws Exception;
	
	public List<QnaDTO> getQna(int m_code);
	
	public List<QnaDTO> getDetail(QnaDTO dto);
	
	public int replyWri(QnaDTO dto);
	
	public int replyModi(QnaDTO dto);

	public List<PlayDTO> myPlay(int m_code);
	
	public List<QnaDTO> getQnaAsPlay(int p_id);

}
