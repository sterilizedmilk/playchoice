package com.playchoice.admin.dao;

import java.util.List;

import com.playchoice.member.dto.MemberDTO;
import com.playchoice.play.dto.SearchPlayDTO;

public interface AdminDAO {

	public List<MemberDTO> memberList(SearchPlayDTO search);
	public int black(int m_id);
	public int unBlack(int m_id);
	public int approvePlayAdmin(int m_id);
	public int dismissPlayAdmin(int m_id);

	public int settleMoney();
	
}
