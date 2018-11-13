package com.playchoice.actor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.playchoice.actor.dto.SearchActorDTO;

@Controller
@RequestMapping("actor")
public class ActorController {
	
	@RequestMapping(value = "list", method=RequestMethod.GET)
	public String actorListController(@RequestParam(required = false) SearchActorDTO search) {
		return "";
	}
	
	@RequestMapping("detail")
	public String actordetailController() {
		return "";
	}
}
