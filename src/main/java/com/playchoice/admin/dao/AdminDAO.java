package com.playchoice.admin.dao;

public interface AdminDAO {

//	public List<MemberDTO> memberList(SearchDTO seatch);
	public int black(int m_id);
	public int unBlack(int m_id);
	public int approvePlayAdmin(int m_id);
	public int dismissPlayAdmin(int m_id);

}
