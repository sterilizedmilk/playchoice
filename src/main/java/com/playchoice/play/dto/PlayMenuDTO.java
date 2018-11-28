package com.playchoice.play.dto;

/*
연극 지역과 장르 선택 시 
두개를 한번에 담을 수 있는 공간이 없음*/
public class PlayMenuDTO {
	int a_id = 0, g_id = 0;
	String s_tab = "mainlist";

	public String getS_tab() {
		return s_tab;
	}

	public void setS_tab(String s_tab) {
		this.s_tab = s_tab;
	}

	@Override
	public String toString() {
		return "PlayMenuDTO [a_id=" + a_id + ", g_id=" + g_id + ", s_tab=" + s_tab + "]";
	}

	public int getA_id() {
		return a_id;
	}

	public void setA_id(int a_id) {
		this.a_id = a_id;
	}

	public int getG_id() {
		return g_id;
	}

	public void setG_id(int g_id) {
		this.g_id = g_id;
	}

}
