package com.playchoice.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.playchoice.payment.dto.PaymentDTO;
import com.playchoice.review.dto.ReviewDTO;
import com.playchoice.review.service.ReviewService;

@Controller
@RequestMapping("play/review")
public class ReviewController {
	
	@Autowired
	ReviewService service;

	//리뷰 작성페이지
	@RequestMapping("write")
	public String reviewPage(PaymentDTO dto,Model model) {
		
		model.addAttribute("actorList", service.actorInfo(dto));
		model.addAttribute("m_code",dto.getM_code());
		model.addAttribute("p_id",dto.getP_id());
		
		return "payment/reviewReg";
	}
	
	//리뷰 등록하기
	@RequestMapping("reviewReg")
	public String reviewReg(ReviewDTO dto) {
		System.out.println(dto);
		
//		service.regReview(dto);
		
		return "redirect:/payment/info?p_id="+dto.getP_id();
	}
}
