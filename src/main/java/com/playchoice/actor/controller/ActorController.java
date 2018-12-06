package com.playchoice.actor.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.playchoice.actor.service.ActorService;
import com.playchoice.actor.service.PlayAppearService;
import com.playchoice.member.dto.MemberDTO;
import com.playchoice.play.dto.PlayDTO;
import com.playchoice.play.service.PlayService;

/**
 * 배우 정보 열람/검색 및 찜하기
 */
@Controller
@RequestMapping(value = "/actor")
public class ActorController {

	@Autowired
	ActorService actorService;
	
	@Autowired
	PlayService playService;
	
	@Autowired
	PlayAppearService appearService;

	// 배우 목록/검색
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String actorListController(@RequestParam(required = false) String keyword, Model model) throws Exception {
		model.addAttribute("actorList", actorService.listActor(keyword));
		return "actor/actorList";
	}

	// 배우 정보 조회
	@RequestMapping(value = "/detail")
	public String actordetailController(@RequestParam("a_id") int a_id, Model model) throws Exception {
		List<PlayDTO> appearDTO = appearService.appearList(a_id);
		
		model.addAttribute("actorDTO", actorService.getActor(a_id));
		
		// 출연작품
		model.addAttribute("appearDTO", appearDTO);
		
		// 평점
		model.addAttribute("reviewScore", actorService.getReviewScore(a_id));
		
		return "actor/actorDetail";
	}

	// 배우 찜하기 아직못했음
	@RequestMapping(value = "mypick", method = RequestMethod.POST)
	public void mypickActor(String a_id, HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		System.out.println(dto.getM_code());
		System.out.println(a_id);

		actorService.mypickActor(dto, a_id);
	}

}
