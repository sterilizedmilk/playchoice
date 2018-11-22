package com.playchoice.qna.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.playchoice.qna.dto.QnaDTO;
import com.playchoice.qna.service.QnaService;
@Controller
@RequestMapping("qna")
public class QnaController {

	@Autowired
	QnaService service;
	
	@RequestMapping(value="insertQues", method=RequestMethod.POST)
	String insertQues(@RequestParam HashMap<String, Object> res,
			Model model) {
		System.out.println(res);
		System.out.println("큐앤에이 인써트 컨트롤러");
		
		
		if(service.insertQuset(res) != 1) {
			model.addAttribute("msg", "등록실패");
			model.addAttribute("url", "../play/playdetail?p_id="+res.get("p_id"));
		}else {
			model.addAttribute("msg", "등록완료");
			model.addAttribute("url", "../play/playdetail?p_id="+res.get("p_id"));
		}
		return "qna/result";
	}
	
	@RequestMapping(value="delete")
	String deleteQues(HttpServletRequest request
			,QnaDTO dto
			,Model model) {
		System.out.println("딜리트 QNA 컨트롤러");
		System.out.println(dto);
		HttpSession session = request.getSession();
		System.out.println("세션 : " + session.getAttribute("login.p_id"));
		model.addAttribute("msg", "등록실패");
		model.addAttribute("url", "../play/playdetail?p_id="+dto.getP_id());
		
		return "qna/result";
		
	}
	
}