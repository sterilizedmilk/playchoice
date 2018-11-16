package com.playchoice.actor.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.playchoice.actor.dto.SearchActorDTO;
import com.playchoice.actor.service.ActorService;


/**
 * 배우 정보 열람/검색 및 찜하기
 */
@Controller
@RequestMapping("actor")
public class ActorController {
	
	@Autowired
	ActorService service;
	
	// 배우 목록/검색
	@RequestMapping(value = "list", method=RequestMethod.GET)
	public String actorListController(@RequestParam(required = false) String keyword
			, Model model){
		model.addAttribute("actorList",service.listActor(keyword));

		return "actor/actorList";
	}
	
	// 배우 정보
	@RequestMapping("detail")
	public String actordetailController() {
		return "";
	}
	
	@RequestMapping("insertActor")
	public String insertActor() {
		return "actor/insertActor";
	}
	
	@RequestMapping(value="insertActor", method=RequestMethod.POST)
	public String insertActorSubmit() {
		return "actor/insertActor";
	}
}
