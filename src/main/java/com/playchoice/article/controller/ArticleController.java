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
import com.playchoice.article.dto.ReplyDTO;
import com.playchoice.article.dto.Status;

@Controller
@RequestMapping("/article/{Content}/{No}")
public class ArticleController {
	Status status = new Status();

	@Autowired
	ArticleDAO dao;

	// a_target 1 = 공지사항 2 = FAQ 3 = 1:1문의
	@ModelAttribute("data")
	public Object Article(@PathVariable("Content") String content, @PathVariable("No") String no, ArticleDTO dto,
			HttpServletRequest request) {
		Object res = null;
		System.out.println(content + "/" + no);
		// 전체 리스트 개수
		int totalCount = 0;
		String contentType = "";

		switch (no) {
		case "list":
			if (content.equals("contact")) {
				contentType = "3";
				res = dao.list(dto);
			} else {
				if (content.equals("notice"))
					contentType = "1";
				else if (content.equals("faq"))
					contentType = "2";
				res = dao.list(contentType);
			}
			break;
		case "detail":
			dto = (ArticleDTO) dao.selectOne(dto.getA_id());

			if (dto.getA_comment() != null) {
				// if (dto.getA_comment().equals("1"))
				dto.setObjReplay(dao.Replylist(dto));
			}
			res = dto;
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
			String sboardType = request.getParameter("target");
			if (sboardType.equals("notice"))
				dto.setA_board("1");
			else if (sboardType.equals("faq"))
				dto.setA_board("2");
			else
				dto.setA_board("3");

			res = dao.insertOne(dto);
			status.setMsg("등록되었습니다.");
			if (sboardType.equals("notice"))
				status.setUrl("list");
			else if (sboardType.equals("faq"))
				status.setUrl("list");
			else
				status.setUrl("list?m_code=" + dto.getM_code());

			break;
		// 수정 후 db처리
		case "modifyReg":
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
		// 댓글
		case "comment":
			ReplyDTO reDto = new ReplyDTO();
			if (dto.getM_level().equals(2))
				dto.setA_comment("1");
			else
				dto.setA_comment("0");

			reDto.setA_id(dto.getA_id());
			reDto.setRe_comment(dto.getA_comment());

			res = dao.commentOne(reDto, dto);
			status.setMsg("댓글이 입력되었습니다.");
			status.setUrl("detail?a_id=" + dto.getA_id());
			System.out.println("getA_comment" + res);
			break;
		default:
			break;
		}
		return res;

	}

	@RequestMapping()
	public String view(@PathVariable("Content") String content, @PathVariable("No") String no) {
		String spath = "";
		String[] arr = { "deleteReg", "modifyReg", "insertReg", "insertMurtiReg", "insertErrorReg", "comment" };

		if (Arrays.asList(arr).contains(content) || Arrays.asList(arr).contains(no))
			spath = "page/alert";
		else if (!no.equals("list"))
			spath = "article/" + no;
		else
			spath = "article/" + content;

		System.out.println(spath + "==================");
		return spath;
	}

	@ModelAttribute("status")
	public Object statusGo() {
		return status;
	}

}
