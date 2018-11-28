package com.playchoice.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.playchoice.admin.service.SiteAdminService;
import com.playchoice.common.PageDTO;
import com.playchoice.common.Pagination;
import com.playchoice.member.dto.MemberDTO;
import com.playchoice.member.dto.ShoppingBasketDTO;
import com.playchoice.member.service.ShoppingBasketService;
import com.playchoice.play.dto.PlayDTO;

@Controller
@RequestMapping(value = "/basket")
public class ShoppingBasketController {

	@Autowired
	ShoppingBasketService basketService;
	
	@Autowired
	SiteAdminService siteAdminService;
	
	// 찜한 연극 추가
	@RequestMapping(value = "/insert")
	public String insert(@ModelAttribute ShoppingBasketDTO dto, @RequestParam("p_id") int p_id, HttpSession session) throws Exception {
		int m_code = ((MemberDTO) session.getAttribute("login")).getM_code();
		dto.setM_code(m_code);
		dto.setP_id(p_id);
		
		// 찜한 연극 목록에 동일 연극이 있는지 체크
		int cnt = basketService.countBasket(m_code, dto.getP_id());
		if(cnt == 0) { // 없으면 찜한 연극 목록에 추가
			basketService.insertBasket(dto);
		}
		return "redirect:/basket/list";
	}
	
	// 찜한 연극  목록
	@RequestMapping(value = "/list")
	public String list(PageDTO pdto, HttpSession session, Model model) throws Exception {
		int m_code = ((MemberDTO) session.getAttribute("login")).getM_code(); // session에 저장된 m_code

		// List<PlayDTO> list = basketService.shoppingBasketList(m_code); // 그냥 목록
		List<PlayDTO> list = basketService.shoppingBasketPaging(m_code, pdto); // 페이징된 목록
		Pagination pagination = new Pagination(pdto);
		pagination.setTotalCnt(basketService.shoppingBasketCount(m_code));
		
		model.addAttribute("genreMap", siteAdminService.genreMap());
		model.addAttribute("list", list);
		model.addAttribute("paging", pagination);
		return "basket/basketList";
	}
	
	// 찜한 연극  삭제
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam("p_id") int p_id) throws Exception {
		basketService.deleteBasket(p_id);
		return "redirect:/basket/list"; // 장바구니 목록으로 리다이렉트
	}
	
}
