package com.playchoice.qna.dto;

import java.sql.Timestamp;

public class QnaDTO {
	
	int q_id, m_code, p_id, q_target_id, q_deleted;
	Timestamp q_time;
	String q_content;
	
	public int getQ_id() {
		return q_id;
	}
	public void setQ_id(int q_id) {
		this.q_id = q_id;
	}
	public int getM_code() {
		return m_code;
	}
	public void setM_code(int m_code) {
		this.m_code = m_code;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public int getQ_target_id() {
		return q_target_id;
	}
	public void setQ_target_id(int q_target_id) {
		this.q_target_id = q_target_id;
	}
	public int getQ_deleted() {
		return q_deleted;
	}
	public void setQ_deleted(int q_deleted) {
		this.q_deleted = q_deleted;
	}
	public Timestamp getQ_time() {
		return q_time;
	}
	public void setQ_time(Timestamp q_time) {
		this.q_time = q_time;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
}
