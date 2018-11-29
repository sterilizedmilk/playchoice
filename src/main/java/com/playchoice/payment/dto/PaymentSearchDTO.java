package com.playchoice.payment.dto;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class PaymentSearchDTO {
	Integer member;
	Integer play;
	
	Integer playAdmin;

	Timestamp from = null;
	Timestamp until = null;
	
	Integer canceled = null;
	Integer scheduleEnded = null;

	Integer page = 1;
	Integer row = 10;

	public Integer getMember() {
		return member;
	}

	public void setMember(Integer member) {
		this.member = member;
	}

	public Integer getPlay() {
		return play;
	}

	public void setPlay(Integer play) {
		this.play = play;
	}

	public Integer getPlayAdmin() {
		return playAdmin;
	}

	public void setPlayAdmin(Integer playAdmin) {
		this.playAdmin = playAdmin;
	}

	public Timestamp getFrom() {
		return from;
	}

	public void setFrom(String from) {
		if (from.isEmpty())
			return;
		
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			this.from = new Timestamp(format.parse(from).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public Timestamp getUntil() {
		return until;
	}

	public void setUntil(String until) {
		if (until.isEmpty())
			return;
		
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		
		try {
			this.until = new Timestamp(format.parse(until).getTime()) ;
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	public Integer getCanceled() {
		return canceled;
	}

	public void setCanceled(Integer canceled) {
		this.canceled = canceled;
	}

	public Integer getStart() {
		return (page - 1) * row;
	}
	
	public Integer getScheduleEnded() {
		return scheduleEnded;
	}

	public void setScheduleEnded(Integer scheduleEnded) {
		this.scheduleEnded = scheduleEnded;
	}

	public void setPage(Integer page) {
		if (page == null || page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	public Integer getRow() {
		return row;
	}

	public void setRow(Integer row) {
		if (row == null || row < 0) {
			this.row = 10;
			return;
		}
		this.row = row;
	}


}
