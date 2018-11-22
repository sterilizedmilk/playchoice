package com.playchoice.play.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.playchoice.play.dto.PlayDTO;
import com.playchoice.play.service.PlayServiceImpl;

/**
 * 연극 목록, 검색, 정보 열람, 예매
 */
@Controller
@RequestMapping("/play")
public class PlayController {

	@Autowired
	private PlayServiceImpl service;

	private static final Logger logger = LoggerFactory.getLogger(PlayController.class);

	// 전체 일정
	@RequestMapping("mainlist")
	public String playListController(Model model) throws Exception {
		logger.info("list get............");
		List<PlayDTO> dto = service.playList();
		model.addAttribute("list", dto);
		return "play/playlist";
	}
	
	// 연극 detail
	@RequestMapping(value = "playdetail", method = RequestMethod.GET)
	public String playDetail(@RequestParam("p_id") int p_id, Model model) throws Exception {
		//play
		model.addAttribute("playDTO",service.playDetail(p_id));
		
		//schedule		
		model.addAttribute("schedule",service.getSchedule(p_id));

		//review
		model.addAttribute("reviewScore",service.getReviewScore(p_id));
		model.addAttribute("reviewSmall", service.getReviewSmall(p_id));
		
		//Q & A 
		System.out.println(service.getQnA(p_id));
		model.addAttribute("qnaAll", service.getQnA(p_id));
		return "play/playdetail";
		
	}
	
	//아작스 연습한거입니다. 무시해주세요
	@RequestMapping("checkSchedule")
	@ResponseBody
	public Object getSchedule(@RequestParam HashMap<String, Object> param) {
		System.out.println("컨트롤 왓다");
		List<Object> res = new ArrayList<Object>();
		res = service.viewCal(param);

		param.put("list", res);

		param.put("msg", "컨트롤 왓다리갓다리");

		System.out.println(param.get("list"));
		return param;
	}
	
	//장바구니
	@RequestMapping("bastket")
	public void addBastket(@RequestParam HashMap<String, Object> param) {
		// TODO 쿠키적용
		System.out.println(param);
	}
	
	//결제
	@RequestMapping("payment")
	public void directPay(@RequestParam HashMap<String, Object> param) {
		// TODO 로그인여부 확인(인터셉터)
		System.out.println(param);
	}
}