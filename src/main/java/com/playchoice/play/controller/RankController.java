package com.playchoice.play.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.playchoice.play.dto.PlayDTO;
import com.playchoice.play.service.PlayServiceImpl;

/**
 * 주간 랭킹
 */
@Controller
@RequestMapping("/rank")
public class RankController {

	@Autowired
	private PlayServiceImpl service;

	private static final Logger logger = LoggerFactory.getLogger(RankController.class);

	public String RankList(Model model) {
		logger.info("list get............");
		Object obj = service.RankList();
		model.addAttribute("list", obj);
		return "play/playlist";
	}
}