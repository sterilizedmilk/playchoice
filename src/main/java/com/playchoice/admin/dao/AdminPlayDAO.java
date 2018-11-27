package com.playchoice.admin.dao;

import java.util.List;

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
	
	public List<ScheduleDTO> psread(int p_id) throws Exception;
	
	public void pscreate(ScheduleDTO sdto) throws Exception;
	
	public List<QnaDTO> getQna(int m_code);
	
	public List<QnaDTO> getDetail(QnaDTO dto);
	
	public int replyWri(QnaDTO dto);
	
	public int replyModi(QnaDTO dto);
	
	public List<PlayDTO> myPlay(int m_code);
	
	public List<QnaDTO> getQnaAsPlay(int p_id);
}
