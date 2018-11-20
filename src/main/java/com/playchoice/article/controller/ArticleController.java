package com.playchoice.article.controller;
/*
 * 작업명 : 공지사항 작업
작업자 : 추윤지
작업 날짜 : 2018-11-16
*/

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.playchoice.article.dao.ArticleDAO;
import com.playchoice.article.dto.ArticleDTO;
import com.playchoice.article.dto.PageStatusDTO;

@Controller
@RequestMapping("/article/{Content}/{No}")
public class ArticleController {
	PageStatusDTO status = new PageStatusDTO();

	@Autowired
	ArticleDAO dao;

	// a_target 1 = 공지사항 2 = FAQ 3 = 1:1문의
	@ModelAttribute("data")
	public Object Article(@PathVariable("Content") String content, @PathVariable("No") String no, ArticleDTO dto,
			HttpServletRequest request) {
		Object res = null;
		System.out.println(content + "/" + no);
		switch (no) {
		case "list":
			if (content.equals("notice"))
				res = dao.list("1");
			else if (content.equals("faq"))
				res = dao.list("2");
			else
				res = dao.list("3");

			System.out.println("list 정보 : " + res);
			break;
		case "detail":
			res = dao.selectOne(dto.getA_id());
			break;
		// 글작성 화면 노출
		case "insert":
			break;
		// 수정 화면 노출
		case "modify":
			res = dao.selectOne(dto.getA_id());
			break;
		// 삽입 후 db 처리
		case "insertReg":
			if (request.getParameter("target").equals("notice"))
				dto.setA_board("1");
			else if (request.getParameter("target").equals("faq"))
				dto.setA_board("2");
			else
				dto.setA_board("3");

			System.out.println(dto);
			res = dao.insertOne(dto);
			status.setMsg("등록되었습니다.");
			status.setUrl("list");
			break;
		// 수정 후 db처리
		case "modifyReg":
			System.out.println(dto);
			res = dao.modifyOne(dto);
			status.setMsg("수정되었습니다.");
			status.setUrl("list");
			break;
		// 삭제는 기존에 ajax로 삭제할 것인지 물었기 떄문에 바로 삭제
		case "deleteReg":
			res = dao.deleteOne(dto);
			status.setMsg("삭제되었습니다.");
			status.setUrl("list");
			break;
		default:
			break;
		}
		return res;
	}

	@RequestMapping()
	public String view(@PathVariable("Content") String content, @PathVariable("No") String no) {
		String spath = "";
		String[] arr = { "deleteReg", "modifyReg", "insertReg", "insertMurtiReg", "insertErrorReg" };

		if (Arrays.asList(arr).contains(content) || Arrays.asList(arr).contains(no))
			spath = "page/alert";
		else if (!no.equals("list"))
			spath = "article/" + no;
		else
			spath = "article/" + content;

		System.out.println("spath : " + spath);
		return spath;
	}

	@ModelAttribute("status")
	public Object statusGo() {
		return status;
	}

}
