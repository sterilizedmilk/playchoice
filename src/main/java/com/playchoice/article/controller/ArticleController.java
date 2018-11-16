package com.playchoice.article.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.playchoice.article.dao.CustomerCenterDAO;

@Controller
@RequestMapping("/article/{path}")
public class ArticleController {
	@Autowired
	CustomerCenterDAO dao;

	// a_target 1 = 공지사항 2 = FAQ 3 = 1:1 문의
	@ModelAttribute("data")
	public Object Article(@PathVariable("path") String path) {
		Object res = null;
		System.out.println(path);
		switch (path) {
		case "notice":
			res = dao.list("1");
			break;
		case "faq":
			res = dao.list("2");
			break;
		case "contact":
			res = dao.list("3");
			break;
		default:
			break;
		}
		return res;
	}

	@RequestMapping()
	public String view(@PathVariable("path") String path) {
		String spath = "article/" + path;
		return spath;
	}

	@RequestMapping("notice/{no}")
	public String noticeDetailController(@PathVariable(name = "no") int no) {
		return "";
	}

	@RequestMapping("faq/{no}")
	public String FAQDetailController(@PathVariable(name = "no") int no) {
		return "";
	}

	// require login
	@RequestMapping("contact/{no}")
	public String contactDetailController(@PathVariable(name = "no") int no) {
		return "";
	}
}
