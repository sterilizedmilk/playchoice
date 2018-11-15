package com.playchoice.admin.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playchoice.play.dto.SearchPlayDTO;


/**
 * 사이트 관리자 메뉴
 * 사용자 관리, 배우 관리...
 */
@Controller
@RequestMapping("admin")
public class SiteAdminController {

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
	
	
	
	
	@RequestMapping(value = "actor/add", method = RequestMethod.GET)
	public String addActorFormController() {

		return "";
	}
	
	@RequestMapping(value = "actor/add", method = RequestMethod.POST)
	public String addActorActionController() {

		return "";
	}
	
	@RequestMapping(value = "actor/update", method = RequestMethod.GET)
	public String updateActorFormController() {

		return "";
	}
	
	@RequestMapping(value = "actor/update", method = RequestMethod.POST)
	public String updateActorActionController() {

		return "";
	}
	
	@RequestMapping(value = "actor/delete", method = RequestMethod.POST)
	public String deleteActorActionController() {
		return "";
	}
	
	

}
