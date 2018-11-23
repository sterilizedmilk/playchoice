package com.playchoice.play.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class PlayDTO {
	int p_id, m_code, g_id, a_id, lowest_price;
	String p_name, p_info, p_refund_policy, p_location;
	//파일받는 1회용 용도
	List<MultipartFile> p_image;
	//image 5개 받을 곳
	String p_image0, p_image1, p_image2, p_image3, p_image4;
	//글 게시 상태
	boolean p_status;

	// p_refund_policy : 반환정보

	public int getP_id() {
		return p_id;
	}

	public List<MultipartFile> getP_image() {
		return p_image;
	}

	public void setP_image(List<MultipartFile> p_image) {
		this.p_image = p_image;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public int getG_id() {
		return g_id;
	}

	public void setG_id(int g_id) {
		this.g_id = g_id;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_info() {
		return p_info;
	}

	public void setP_info(String p_info) {
		this.p_info = p_info;
	}

	public String getP_refund_policy() {
		return p_refund_policy;
	}

	public void setP_refund_policy(String p_refund_policy) {
		this.p_refund_policy = p_refund_policy;
	}

	public String getP_location() {
		return p_location;
	}

	public void setP_location(String p_location) {
		this.p_location = p_location;
	}

	public int getM_code() {
		return m_code;
	}

	public void setM_code(int m_code) {
		this.m_code = m_code;
	}

	public int getA_id() {
		return a_id;
	}

	public void setA_id(int a_id) {
		this.a_id = a_id;
	}

	public boolean isP_status() {
		return p_status;
	}

	public void setP_status(boolean p_status) {
		this.p_status = p_status;
	}

	public String getP_image0() {
		return p_image0;
	}

	public void setP_image0(String p_image0) {
		this.p_image0 = p_image0;
	}

	public String getP_image1() {
		return p_image1;
	}

	public void setP_image1(String p_image1) {
		this.p_image1 = p_image1;
	}

	public String getP_image2() {
		return p_image2;
	}

	public void setP_image2(String p_image2) {
		this.p_image2 = p_image2;
	}

	public String getP_image3() {
		return p_image3;
	}

	public void setP_image3(String p_image3) {
		this.p_image3 = p_image3;
	}

	public String getP_image4() {
		return p_image4;
	}

	public void setP_image4(String p_image4) {
		this.p_image4 = p_image4;
	}

	public int getLowest_price() {
		return lowest_price;
	}

	public void setLowest_price(int lowest_price) {
		this.lowest_price = lowest_price;
	}
	
	
}
