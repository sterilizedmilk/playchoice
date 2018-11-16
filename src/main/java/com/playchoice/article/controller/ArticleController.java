package com.playchoice.article.controller;
/*
작업명 : 공지사항 작업
작업자 : 추윤지
작업 날짜 : 2018-11-16
*/

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.playchoice.article.dao.CustomerCenterDAO;

@Controller
@RequestMapping("/article/{Content}/{No}")
public class ArticleController {
	@Autowired
	CustomerCenterDAO dao;

	// a_target 1 = 공지사항 2 = FAQ 3 = 1:1문의
	@ModelAttribute("data")
	public Object Article(@PathVariable("Content") String content, @PathVariable("No") String no) {
		Object res = null;
		System.out.println(content + "/" + no);
		switch (content) {
		case "notice":
			switch (no) {
			case "list":
				res = dao.list("1");
				break;
			case "detail":
				break;
			case "insert":
				break;
			case "modify":
				break;
			case "delete":
				break;
			default:
				break;
			}

			break;
		case "faq":
			switch (no) {
			case "list":
				res = dao.list("2");
				break;
			case "detail":
				break;
			case "insert":
				break;
			case "modify":
				break;
			case "delete":
				break;
			default:
				break;
			}

			break;
		case "contact":
			switch (no) {
			case "list":
				res = dao.list("3");
				break;
			case "detail":
				break;
			case "insert":
				break;
			case "modify":
				break;
			case "delete":
				break;
			default:
				break;
			}
			break;
		default:
			break;
		}
		return res;
	}

	@RequestMapping()
	public String view(@PathVariable("Content") String content, @PathVariable("No") String no) {
		String spath = "";
		spath = "article/" + content;
		System.out.println(spath);
		return spath;
	}

	// a_target 1 = 공지사항 2 = FAQ 3 = 1:1문의
	// @RequestMapping("/article/{path}")
	// @ModelAttribute("data")
	// public Object Article(@PathVariable("path") String str) {
	// Object res = null;
	// System.out.println(str);
	// switch (str) {
	// case "notice":
	// res = dao.list("1");
	// break;
	// case "faq":
	// res = dao.list("2");
	// break;
	// case "contact":
	// res = dao.list("3");
	// break;
	// default:
	// break;
	// }
	// return res;
	// }
	//
	// @RequestMapping()
	// public String view(@PathVariable("path") String path) {
	// String spath = "article/" + path;
	// return spath;
	// }

	// @RequestMapping("/article/notice/{no}")
	// public String Notice(@PathVariable("no") String path, ArticleDTO dto) {
	// String str = "";
	// System.out.println(path);
	// switch (path) {
	// case "detail":
	// // str = (String) dao.insertOne(dto);
	// break;
	// case "insert":
	// // str = (String) dao.selectOne(dto);
	// break;
	// case "modify":
	// // str = (String) dao.modifyOne(dto);
	// break;
	// case "delete":
	// // str = (String) dao.deleteOne(dto);
	// break;
	// default:
	// break;
	// }
	// return str;
	// }
	//
	// // 공지사항 view
	// @RequestMapping("/article/notice/{no}")
	// public String noticeView(@PathVariable("no") String path) {
	// String spath = "article/notice/" + path;
	// return spath;
	// }

	// @RequestMapping("/article/faq/{faq}")
	// @ModelAttribute("data")
	// public Object faq(@PathVariable("faq") String path) {
	// Object res = null;
	// System.out.println(path);
	// switch (path) {
	// case "detail":
	// res = dao.list("3");
	// break;
	// case "insert":
	// res = dao.list("1");
	// break;
	// case "modify":
	// res = dao.list("2");
	// break;
	// case "delete":
	// res = dao.list("3");
	// break;
	// default:
	// break;
	// }
	// return res;
	// }
	//
	// // faq view
	// @RequestMapping()
	// public String faqView(@PathVariable("faq") String path) {
	// String spath = "article/faq/" + path;
	// return spath;
	// }
	//
	// @RequestMapping("/article/contact/{contact}")
	// @ModelAttribute("data")
	// public Object contact(@PathVariable("contact") String path) {
	// Object res = null;
	// System.out.println(path);
	// switch (path) {
	// case "detail":
	// res = dao.list("3");
	// break;
	// case "insert":
	// res = dao.list("1");
	// break;
	// case "modify":
	// res = dao.list("2");
	// break;
	// case "delete":
	// res = dao.list("3");
	// break;
	// default:
	// break;
	// }
	// return res;
	// }
	//
	// // contact view
	// @RequestMapping()
	// public String contactView(@PathVariable("contact") String path) {
	// String spath = "article/contact/" + path;
	// return spath;
	// }

	// // 정대
	// @RequestMapping("notice/{no}")
	// public String noticeDetailController(@PathVariable(name = "no") int no) {
	// return "";
	// }
	//
	// @RequestMapping("faq/{no}")
	// public String FAQDetailController(@PathVariable(name = "no") int no) {
	// return "";
	// }
	//
	// @RequestMapping("contact/{no}")
	// public String contactDetailController(@PathVariable(name = "no") int no) {
	// return "";
	// }
}
