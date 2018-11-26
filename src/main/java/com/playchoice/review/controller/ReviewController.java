package com.playchoice.review.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.playchoice.review.service.ReviewService;

@Controller
@RequestMapping("review")
public class ReviewController {
	
	@Autowired
	ReviewService service;
	
	@ResponseBody
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
		
	}
	
	@RequestMapping("reviewReg")
	public String reviewReg() {
		return "payment/reviewReg";
	}

}
