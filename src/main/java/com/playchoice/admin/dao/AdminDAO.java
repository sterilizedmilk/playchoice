package com.playchoice.admin.dao;

import java.util.List;

import com.playchoice.SearchDTO;
import com.playchoice.member.dto.MemberDTO;

public interface AdminDAO {

	public List<MemberDTO> memberList(SearchDTO seatch);
	public int black(int m_id);
	public int unBlack(int m_id);
	public int approvePlayAdmin(int m_id);
	public int dismissPlayAdmin(int m_id);

}
