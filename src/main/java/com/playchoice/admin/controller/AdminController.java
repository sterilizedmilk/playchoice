package com.playchoice.admin.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.playchoice.play.dto.SearchPlayDTO;

@Controller
@RequestMapping("admin")
public class AdminController {

	// list of member
	@RequestMapping("member")
	public String memberListController(SearchPlayDTO search) {

		return "";
	}
	
	@RequestMapping("member/{m_id}")
	public String memberDetailController(@PathVariable("m_id") int m_id) {
		return "";
	}

	// ajax
	@RequestMapping("member/Black")
	public ResponseEntity<String> memberBlackController(int m_id) {

		return null;
	}

	// ajax
	@RequestMapping("member/unBlack")
	public ResponseEntity<String> memberUnBlackController(int m_id) {

		return null;
	}

}
