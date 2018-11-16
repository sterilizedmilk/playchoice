package com.playchoice.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	// 메인 페이지 로딩
	@RequestMapping("page/main")
	String getmain() {
		return "main";
	}

	// 전체 보기 리스트 로딩
	@RequestMapping("page/mainlist")
	String getlist() {
		return "page/mainlist";
	}
}
