package com.playchoice.article.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class ArticleController {

	@RequestMapping("notice")
	public String noticeListController() {
		return "";
	}
	
	@RequestMapping("notice/{no}")
	public String noticeDetailController(@PathVariable(name="no") int no) {
		return "";
	}
	
	@RequestMapping("FAQ")
	public String FAQListController() {
		return "";
	}
	
	@RequestMapping("FAQ/{no}")
	public String FAQDetailController(@PathVariable(name="no") int no) {
		return "";
	}
	
	@RequestMapping("contact")
	public String contactListController() {
		return "";
	}
	
	//require login
	@RequestMapping("contact/{no}")
	public String contactDetailController(@PathVariable(name="no") int no) {
		return "";
	}
	
	
}
