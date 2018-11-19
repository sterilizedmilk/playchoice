package com.playchoice.play.dto;

import java.util.Date;

public class PlayshowDTO {
	
	int s_id,p_id,s_ticket,s_price,a_id1,a_id2,s_canceled;
	Date s_time;
	
	
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int s_id) {
		this.s_id = s_id;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public int getS_ticket() {
		return s_ticket;
	}
	public void setS_ticket(int s_ticket) {
		this.s_ticket = s_ticket;
	}
	public int getS_price() {
		return s_price;
	}
	public void setS_price(int s_price) {
		this.s_price = s_price;
	}
	public int getA_id1() {
		return a_id1;
	}
	public void setA_id1(int a_id1) {
		this.a_id1 = a_id1;
	}
	public int getA_id2() {
		return a_id2;
	}
	public void setA_id2(int a_id2) {
		this.a_id2 = a_id2;
	}
	public int getS_canceled() {
		return s_canceled;
	}
	public void setS_canceled(int s_canceled) {
		this.s_canceled = s_canceled;
	}
	public Date getS_time() {
		return s_time;
	}
	public void setS_time(Date s_time) {
		this.s_time = s_time;
	}
	
	
}
