package com.playchoice.article.dto;

import java.security.Timestamp;
import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("replyDTO")
public class ReplyDTO {
	@Override
	public String toString() {
		return "ReplyDTO [a_id=" + a_id + ", re_id=" + re_id + ", a_comment=" + a_comment + ", a_time=" + a_time + "]";
	}

	int a_id, re_id;
	String a_comment;
	Date a_time;

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

	public String getA_comment() {
		return a_comment;
	}

	public void setA_comment(String a_comment) {
		this.a_comment = a_comment;
	}

	public Date getA_time() {
		return a_time;
	}

	public void setA_time(Date a_time) {
		this.a_time = a_time;
	}

}
