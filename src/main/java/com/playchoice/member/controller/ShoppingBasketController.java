package com.playchoice.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.playchoice.member.dto.ShoppingBasketDTO;
import com.playchoice.member.service.ShoppingBasketService;

@Controller
@RequestMapping(value = "/basket")
public class ShoppingBasketController {

	@Autowired
	ShoppingBasketService basketService;
	
	// 장바구니 추가
	@RequestMapping(value = "/insert")
	public String insert(@ModelAttribute ShoppingBasketDTO dto, HttpSession session) throws Exception {
		int m_code = (int) session.getAttribute("m_code");
		dto.setM_code(m_code);
		// 장바구니에 기존 상품이 있는지 체크
		int cnt = basketService.checkBasket(dto.getP_id(), m_code);
		if(cnt == 0) { // 없으면 장바구니에 추가
			basketService.insertBasket(dto);
		}
		return "redirect:/basket/list";
	}
	
	// 장바구니 목록
	/*@RequestMapping(value = "/list")
	public ModelAndView list(HttpSession session, ModelAndView mav) throws Exception {
		int m_code = (int) session.getAttribute("m_code"); // session에 저장된 m_code
		Map<String, Object> map = new HashMap<String, Object>();
		List<ShoppingBasketDTO> list = basketService.ShoppingBasketList(m_code); // 장바구니 정보
		
	}*/
	
	// 장바구니 수정
	
	// 장바구니 삭제
}
