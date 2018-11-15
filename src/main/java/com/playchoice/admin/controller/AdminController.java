package com.playchoice.admin.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin/member")
public class AdminController {

//	@RequestMapping("list")
//	public String memberListController(SearchDTO search) {
//
//		return "";
//	}

	@RequestMapping("Black")
	public ResponseEntity<String> memberBlackController(int m_id) {

		return null;
	}

	@RequestMapping("unBlack")
	public ResponseEntity<String> memberUnBlackController(int m_id) {

		return null;
	}

}
