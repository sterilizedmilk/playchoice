package com.playchoice.play.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.playchoice.play.service.PlayServiceImpl;

/**
 * 연극 정보 전체 검색
 */
@Controller
@RequestMapping("/search")
public class SearchController {

	@Autowired
	private PlayServiceImpl service;

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

}