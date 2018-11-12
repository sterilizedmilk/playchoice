package com.playchoice.member.dto;

public class MemberDTO {
	int m_code;
	String m_id, m_pw, m_name, m_mail, m_phone;
	byte m_sep, m_black;

	public int getM_code() {
		return m_code;
	}

	public void setM_code(int m_code) {
		this.m_code = m_code;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_mail() {
		return m_mail;
	}

	public void setM_mail(String m_mail) {
		this.m_mail = m_mail;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public byte getM_sep() {
		return m_sep;
	}

	public void setM_sep(byte m_sep) {
		this.m_sep = m_sep;
	}

	public byte getM_black() {
		return m_black;
	}

	public void setM_black(byte m_black) {
		this.m_black = m_black;
	}

}
