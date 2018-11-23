package com.playchoice.article.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("replyDTO")
public class ReplyDTO {

	@Override
	public String toString() {
		return "ReplyDTO [a_id=" + a_id + ", re_id=" + re_id + ", re_comment=" + re_comment + ", re_time=" + re_time
				+ "]";
	}

	int a_id, re_id;
	String re_comment;
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
