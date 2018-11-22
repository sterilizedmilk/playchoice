package com.playchoice.qna.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	
}