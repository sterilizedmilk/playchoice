package com.playchoice.play.dto;

public class PlayDTO {
	int p_id, t_id, p_score_total, g_id; // enum?
	String p_name, p_info, p_refund_policy, p_location;

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public int getT_id() {
		return t_id;
	}

	public void setT_id(int t_id) {
		this.t_id = t_id;
	}

	public int getP_score_total() {
		return p_score_total;
	}

	public void setP_score_total(int p_score_total) {
		this.p_score_total = p_score_total;
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

}
