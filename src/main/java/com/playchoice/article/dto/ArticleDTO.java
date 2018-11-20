package com.playchoice.article.dto;

import java.sql.Timestamp;
import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("aaaDTO")
public class ArticleDTO {
	Integer a_id, m_code, a_target, a_solved;
	Timestamp a_time;
	String a_board, a_title, a_content, a_comment;

	public String getA_comment() {
		return a_comment;
	}

	public void setA_comment(String a_comment) {
		this.a_comment = a_comment;
	}

	public Integer getA_id() {
		return a_id;
	}


	@Override
	public String toString() {
		return "ArticleDTO [a_id=" + a_id + ", m_code=" + m_code + ", a_target=" + a_target + ", a_solved=" + a_solved
				+ ", a_time=" + a_time + ", a_board=" + a_board + ", a_title=" + a_title + ", a_content=" + a_content
				+ ", a_comment=" + a_comment + "]";
	}

	public void setA_id(Integer a_id) {
		this.a_id = a_id;
	}

	public Integer getM_code() {
		return m_code;
	}

	public void setM_code(Integer m_code) {
		this.m_code = m_code;
	}

	public Integer getA_target() {
		return a_target;
	}

	public void setA_target(Integer a_target) {
		this.a_target = a_target;
	}

	public Integer getA_solved() {
		return a_solved;
	}

	public void setA_solved(Integer a_solved) {
		this.a_solved = a_solved;
	}

	public Date getA_time() {
		return a_time;
	}

	public String getA_board() {
		return a_board;
	}

	public void setA_board(String a_board) {
		this.a_board = a_board;
	}

	public void setA_time(Timestamp a_time) {
		this.a_time = a_time;
	}

	public String getA_title() {
		return a_title;
	}

	public void setA_title(String a_title) {
		this.a_title = a_title;
	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

}
