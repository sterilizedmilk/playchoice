package com.playchoice.common;

public class PageDTO {

	private int page; // 현재 페이지 번호
	private int perPage; // 페이지 당 게시글 수
	
	public PageDTO() {
		this.page = 1;
		this.perPage = 5;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page <= 0 ? 1 : page;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage <= 0 ? 5 : perPage;
	}
	
	public int getStartNum() {
		return (page - 1) * perPage;
	}
	
}
