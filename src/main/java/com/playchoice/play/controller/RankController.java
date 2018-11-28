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
public class RankController {

	@Autowired
	private PlayServiceImpl service;

	private static final Logger logger = LoggerFactory.getLogger(RankController.class);

	@RequestMapping("/rank")
	public String RankList(Model model) {
		List<PlayDTO> obj = (List<PlayDTO>) service.RankList();
		if (obj.size() > 10) {
			for (int i = 10; i < obj.size(); i++)
				obj.remove(i);
		}
		model.addAttribute("list", obj);

		return "play/ranklist";
	}
}