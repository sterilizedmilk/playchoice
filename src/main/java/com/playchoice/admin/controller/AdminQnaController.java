package com.playchoice.admin.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.playchoice.admin.service.AdminPlayService;
import com.playchoice.qna.dto.QnaDTO;

@Controller
@RequestMapping("admin/qna")
public class AdminQnaController {

	@Autowired
	private AdminPlayService service;
	
	//Q & A 리스트
	@RequestMapping("qnalist")
	public String qnaList(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		model.addAttribute("qnaList",service.getQna(1));
		
//		MemberDTO res = (MemberDTO)session.getAttribute("login");
//			if(res != null) { //세션 체크
//				model.addAttribute("qnaList",service.getQna(res.getM_code()));
//			
//			}else {
//				
//				model.addAttribute("msg","로그인해야합니다.");
//				model.addAttribute("url", "../../");
//			}
	
		return "admin/qna/qnalist";
	}
	
	@RequestMapping("qnadetail")
	public String qnaDetail(HttpServletRequest request, QnaDTO dto, Model model) {
		
		model.addAttribute("list", service.getDetail(dto));
		
		
		return "admin/qna/qnadetail";
	}
	
	@RequestMapping("write")
	public String replyWri(
			HashMap<String, Object> map
//			QnaDTO dto
			, Model model) {
		System.out.println("롸이트");
		
		System.out.println(map);
//		System.out.println(dto);
//		service.replyWri(dto);
		
		
		return "redirect:/admin/qna/qnalist";
	}
	
	@RequestMapping("modify")
	public String replyModi(QnaDTO dto, Model model) {
		
		service.replyModi(dto);
		
		
		return "admin/qna/qnalist";
	}
	
}
