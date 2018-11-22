/*package com.playchoice.article.dto;

public class Criteria {

	private int page;
	private int perPageNum;

	public int getPageStart() {
		return (this.page - 1) * this.perPageNum;
	}

	public Criteria() {
		this.page = 1; // 사용자가 세팅하지 않으면 기본 1
		this.perPageNum = 10; // 페이지 당 기본 10개식 출력
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0)
			// 페이지는 1페이지부터 0보다 작거나 같은 값일 경우, 무조건 첫번째 페이지로 설정되도록
			this.page = 1;
		else
			this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100)
			this.perPageNum = 10;
		else
			this.perPageNum = perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
}*/