package com.playchoice.review.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.playchoice.payment.dto.PaymentDTO;
import com.playchoice.review.dto.ReviewDTO;
import com.playchoice.review.service.ReviewService;

@Controller
@RequestMapping("play/review")
public class ReviewController {
	
	@Autowired
	ReviewService service;
	
/*	@ResponseBody
	@RequestMapping(value="playtotalreview", method=RequestMethod.POST)
	public Object totalReview(@RequestParam int p_id) {
		System.out.println("리뷰 컨트롤");
		
		System.out.println(service.getTotalReview(p_id));
		
		HashMap<String, Object> res = new HashMap<>();
		res.put("reviews", service.getTotalReview(p_id));
		
//		ArrayList<Object> res = new ArrayList<>();
//		res.add(service.getTotalReview(p_id));
//		
		
		return res;
		
	}*/
	
	@RequestMapping("write")
	public String reviewPage(@RequestParam("p_name")String p_name, PaymentDTO dto,Model model) {
	
		model.addAttribute("p_name", p_name);
		
		model.addAttribute("actorList", service.actorInfo(dto));
		model.addAttribute("s_id",dto.getS_id());
		
		
		return "payment/reviewReg";
	}
	
	@RequestMapping("reviewReg")
	public String reviewReg(ReviewDTO dto) {
		
		service.regReview(dto);
		
		return null;
	}
}
