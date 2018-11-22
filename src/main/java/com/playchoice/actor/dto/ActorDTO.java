package com.playchoice.actor.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.stereotype.Component;

@Alias("actorDTO")
@Component
public class ActorDTO {
	int a_id,a_deleted;
	public int getA_deleted() {
		return a_deleted;
	}

	public void setA_deleted(int a_deleted) {
		this.a_deleted = a_deleted;
	}

	String a_name, a_homepage, a_picture;
	Date a_birth;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	
	//날짜 형식 변경 
	public String getSdf() {
		String res = sdf.format(a_birth);
		//1900.01.01은 배우등록시 생일이 null일 경우 기본값임
		if(res == null || res.equals("") ||("1900.01.01").equals(res)) {
			return "-";
		}else
			return res;
	}
	
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

	public Date getA_birth() {
		return a_birth;
	}

	public void setA_birth(Date a_birth) {
		this.a_birth = a_birth;
	}

}
