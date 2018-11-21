package com.playchoice.qna.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.playchoice.qna.service.QnaService;
import com.playchoice.qna.dto.*;
@Controller
@RequestMapping("qna")
public class QnaController {

	@Autowired
	QnaService service;
	
	@RequestMapping(value="insertQues", method=RequestMethod.POST)
	String insertQues(@RequestParam HashMap<String, Object> res) {
		System.out.println(res);
		System.out.println("큐앤에이 인써트 컨트롤러");
		
		service.insertQuset(res);
		
		return null;
	}
	
	@RequestMapping(value="alertResult")
	String 
}
