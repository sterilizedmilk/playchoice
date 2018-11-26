package com.playchoice.admin.service;

import java.util.List;

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
	
	public List<ScheduleDTO> psread(int p_id) throws Exception;
	
	public void psregist(ScheduleDTO sdto) throws Exception;
	
	public List<QnaDTO> getQna(int m_code);
	
	public List<QnaDTO> getDetail(QnaDTO dto);
	
	public int replyWri(QnaDTO dto);
	
	public int replyModi(QnaDTO dto);

}
