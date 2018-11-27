package com.playchoice.payment.dto;

import java.sql.Timestamp;

public class PaymentDTO {
	int p_id, m_code, s_id, p_price, p_quantity, p_cancel_target_id;
	Timestamp p_time;
	int p_canceled = 0;
	
	// for list
	String p_name; // from play
	Timestamp s_time; // from schedule
	
	public PaymentDTO cancel() {
		PaymentDTO can = new PaymentDTO();
		can.m_code = m_code;
		can.s_id = s_id;
		can.p_quantity = -p_quantity;
		can.p_cancel_target_id = p_id;
		return can;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

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

	public int getP_price() {
		return p_price;
	}

	public void setP_price(int p_price) {
		this.p_price = p_price;
	}

	public int getP_quantity() {
		return p_quantity;
	}

	public void setP_quantity(int p_quantity) {
		this.p_quantity = p_quantity;
	}

	public int getP_cancel_target_id() {
		return p_cancel_target_id;
	}

	public void setP_cancel_target_id(int p_cancel_target_id) {
		this.p_cancel_target_id = p_cancel_target_id;
	}

	public Timestamp getP_time() {
		return p_time;
	}

	public void setP_time(Timestamp p_time) {
		this.p_time = p_time;
	}

	public int getP_canceled() {
		return p_canceled;
	}

	public void setP_canceled(int p_canceled) {
		this.p_canceled = p_canceled;
	}

	@Override
	public String toString() {
		return "PaymentDTO [p_id=" + p_id + ", m_code=" + m_code + ", s_id=" + s_id + ", p_price=" + p_price
				+ ", p_quantity=" + p_quantity + ", p_cancel_target_id=" + p_cancel_target_id + ", p_time=" + p_time
				+ ", p_canceled=" + p_canceled + "]";
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public Timestamp getS_time() {
		return s_time;
	}

	public void setS_time(Timestamp s_time) {
		this.s_time = s_time;
	}
	
}
