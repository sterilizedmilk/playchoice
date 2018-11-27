package com.playchoice.article.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("replyDTO")
public class ReplyDTO {

	@Override
	public String toString() {
		return "ReplyDTO [a_id=" + a_id + ", re_id=" + re_id + ", m_code=" + m_code + ", re_comment=" + re_comment
				+ ", m_id=" + m_id + ", m_level=" + m_level + ", re_time=" + re_time + "]";
	}

	int a_id, re_id, m_code;
	String re_comment, m_id, m_level;

	public String getM_id() {
		return m_id;
	}

	public String getM_level() {
		return m_level;
	}

	public void setM_level(String m_level) {
		this.m_level = m_level;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getM_code() {
		return m_code;
	}

	public void setM_code(int m_code) {
		this.m_code = m_code;
	}

	Date re_time;

	public Date getRe_time() {
		return re_time;
	}

	public void setRe_time(Date re_time) {
		this.re_time = re_time;
	}

	public int getA_id() {
		return a_id;
	}

	public void setA_id(int a_id) {
		this.a_id = a_id;
	}

	public int getRe_id() {
		return re_id;
	}

	public void setRe_id(int re_id) {
		this.re_id = re_id;
	}

	public String getRe_comment() {
		return re_comment;
	}

	public void setRe_comment(String re_comment) {
		this.re_comment = re_comment;
	}

}
