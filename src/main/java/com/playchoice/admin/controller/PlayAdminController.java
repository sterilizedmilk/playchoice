package com.playchoice.admin.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * 연극 관리자 메뉴
 * 연극 추가, 연극 정보 수정, 정산
 */
@Controller
@RequestMapping("admin/play")
public class PlayAdminController {
//	@Autowired
//	SqlSession session;
	
	@RequestMapping("aplist") // 연극 관리자 연극 리스트 보기 호출
	public String apList(HttpSession ses, Model model) {
//		Object a = ses.getAttribute("user_id"); //user_id 관련 들고 들어오다
//		List<PlayDTO> plays = (List<PlayDTO>) session.selectList("queryurl", a); //mapper에 설정되어있다 -> list에 입력
//		model.addAttribute("playList", plays); //playList 
//		
		return "";
	}
	
	// 연극 추가 폼
	@RequestMapping(value="/apadd", method=RequestMethod.GET)
	public String apAddGET() {
		
		return "admin/play/apaddForm";
	}
	//연극 추가
	@RequestMapping(value="/apadd", method=RequestMethod.POST)
	public String apAddPOST(){
		
		return "";
	}
	
	// 연극 정보 수정 폼
	@RequestMapping(value="/apmodify", method=RequestMethod.GET)
	public String apModifyGET() {
		
		return "admin/play/apmodifyForm";
	}
	//연극 정보 수정
	@RequestMapping(value="/apmodify", method=RequestMethod.POST)
	public String apModifyPOST() {
		return "";
	}
	
	// 정산
	// 전체 정산 리스트 (검색/ 분류/ 날짜별? 연극별? 결제->정산 /)
	// 눈에 띄게 보이는거 -> 표? 영수증형태?
}
