package com.playchoice.actor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.playchoice.actor.dto.SearchActorDTO;


/**
 * 배우 정보 열람/검색 및 찜하기
 */
@Controller
@RequestMapping("actor")
public class ActorController {
	
	// 배우 목록/검색
	@RequestMapping(value = "list", method=RequestMethod.GET)
	public String actorListController(@RequestParam(required = false) SearchActorDTO search) {
		return "";
	}
	
	// 배우 정보
	@RequestMapping("detail")
	public String actordetailController() {
		return "";
	}
}
