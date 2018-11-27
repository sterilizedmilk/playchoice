package com.playchoice.review.dto;

import java.util.Date;

public class ReviewDTO {
	
	int m_code,s_id,r_play_score,r_actor1_score,r_actor2_score,r_deleted;
	Date r_register_time;
	String r_content;
	
	public int getM_code() {
		return m_code;
	}
	public void setM_code(int m_code) {
		this.m_code = m_code;
	}
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public int getR_play_score() {
		return r_play_score;
	}
	public void setR_play_score(int r_play_score) {
		this.r_play_score = r_play_score;
	}
	public int getR_actor1_score() {
		return r_actor1_score;
	}
	public void setR_actor1_score(int r_actor1_score) {
		this.r_actor1_score = r_actor1_score;
	}
	public int getR_actor2_score() {
		return r_actor2_score;
	}
	public void setR_actor2_score(int r_actor2_score) {
		this.r_actor2_score = r_actor2_score;
	}
	public int getR_deleted() {
		return r_deleted;
	}
	public void setR_deleted(int r_deleted) {
		this.r_deleted = r_deleted;
	}
	public Date getR_register_time() {
		return r_register_time;
	}
	public void setR_register_time(Date r_register_time) {
		this.r_register_time = r_register_time;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	
	
}
