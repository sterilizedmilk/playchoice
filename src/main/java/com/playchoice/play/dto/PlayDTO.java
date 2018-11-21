package com.playchoice.play.dto;

import org.apache.ibatis.type.Alias;

public class PlayDTO {
	int p_id, m_code, g_id, a_id;
	String p_name, p_info, p_refund_policy, p_location , p_picture;
	boolean p_status;
	
	// p_refund_policy : 반환정보

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}


	public int getG_id() {
		return g_id;
	}

	public void setG_id(int g_id) {
		this.g_id = g_id;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_info() {
		return p_info;
	}

	public void setP_info(String p_info) {
		this.p_info = p_info;
	}

	public String getP_refund_policy() {
		return p_refund_policy;
	}

	public void setP_refund_policy(String p_refund_policy) {
		this.p_refund_policy = p_refund_policy;
	}

	public String getP_location() {
		return p_location;
	}

	public void setP_location(String p_location) {
		this.p_location = p_location;
	}

	public int getM_code() {
		return m_code;
	}

	public void setM_code(int m_code) {
		this.m_code = m_code;
	}

	public int getA_id() {
		return a_id;
	}

	public void setA_id(int a_id) {
		this.a_id = a_id;
	}

	public boolean isP_status() {
		return p_status;
	}

	public void setP_status(boolean p_status) {
		this.p_status = p_status;
	}

	public String getP_picture() {
		return p_picture;
	}

	public void setP_picture(String p_picture) {
		this.p_picture = p_picture;
	}

	@Override
	public String toString() {
		return "PlayDTO [p_id=" + p_id + ", m_code=" + m_code + ", g_id=" + g_id + ", a_id=" + a_id + ", p_name="
				+ p_name + ", p_info=" + p_info + ", p_refund_policy=" + p_refund_policy + ", p_location=" + p_location
				+ ", p_picture=" + p_picture + ", p_status=" + p_status + "]";
	}
}
