package com.playchoice.actor.dto;

import java.sql.Timestamp;

public class ActorDTO {
	int a_id;
	String a_name, a_homepage, a_picture;
	Timestamp a_birth;

	public int getA_id() {
		return a_id;
	}

	public void setA_id(int a_id) {
		this.a_id = a_id;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public String getA_homepage() {
		return a_homepage;
	}

	public void setA_homepage(String a_homepage) {
		this.a_homepage = a_homepage;
	}

	public String getA_picture() {
		return a_picture;
	}

	public void setA_picture(String a_picture) {
		this.a_picture = a_picture;
	}

	public Timestamp getA_birth() {
		return a_birth;
	}

	public void setA_birth(Timestamp a_birth) {
		this.a_birth = a_birth;
	}

}
