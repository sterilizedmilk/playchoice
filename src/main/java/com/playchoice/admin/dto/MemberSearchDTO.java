package com.playchoice.admin.dto;

public class MemberSearchDTO {
	Integer level = null;
	Integer code = null;
	Integer status = null;
	String id = null;
	String name = null;
	
	Integer start = 0;

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getStart() {
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}
	
	public void setPage(Integer page) {
		if (page == null || page < 1)
			page = 1;
		
		start = (page - 1) * 10;
	}
}
