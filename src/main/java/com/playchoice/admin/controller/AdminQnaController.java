package com.playchoice.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.playchoice.admin.service.AdminPlayService;

@Controller
@RequestMapping("admin/qna")
public class AdminQnaController {

	@Autowired
	private AdminPlayService service;
	
	//Q & A 리스트
	@RequestMapping("qnalist")
	public String qnaList() {
		System.out.println("연극관리자 큐엔에이 컨트롤러");
		
		return "admin/qna/qnalist";
	}
	
}
