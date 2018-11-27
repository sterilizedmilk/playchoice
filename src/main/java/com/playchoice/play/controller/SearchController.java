package com.playchoice.play.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.playchoice.play.service.PlayServiceImpl;

/**
 * 연극 정보 전체 검색
 */
@Controller
public class SearchController {

	@Autowired
	private PlayServiceImpl service;

	@RequestMapping("/search")
	public String RankList(Model model, String search) {
		System.out.println(search);
		String strtmp = search;
		strtmp = strtmp.trim();
		strtmp = strtmp.replace(" ", "");

		Object obj = service.SearchList(strtmp);
		model.addAttribute("list", obj);
		return "play/seachlist";
	}

}