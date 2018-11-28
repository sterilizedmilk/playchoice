package com.playchoice.member.controller;

import java.util.List;
import java.util.prefs.PreferenceChangeListener;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.common.PageDTO;
import com.playchoice.common.Pagination;
import com.playchoice.member.dto.MemberDTO;
import com.playchoice.member.dto.PreferActorDTO;
import com.playchoice.member.service.PreferActorService;

@Controller
@RequestMapping(value = "/prefer")
public class PreferActorController {
	
	@Autowired
	PreferActorService preferService;

	// 찜한 배우 추가
	@RequestMapping(value = "/insert")
	public String insert(@ModelAttribute PreferActorDTO dto, @RequestParam("a_id") int a_id, HttpSession session) throws Exception {
		int m_code = ((MemberDTO) session.getAttribute("login")).getM_code();
		dto.setM_code(m_code);
		dto.setA_id(a_id);
		System.out.println(a_id);
		
		// 찜한 배우 목록에 동일 배우가 있는지 체크
		int cnt = preferService.countPrefer(m_code, dto.getA_id());
		if(cnt == 0) { // 없으면 찜한 배우 목록에 추가
			preferService.insertPrefer(dto);
		}
		return "redirect:/prefer/list"; // 선호배우 목록으로 리다이렉트
	}
	
	// 찜한 배우 목록
	@RequestMapping(value = "/list")
	public String list(PageDTO pdto, HttpSession session, Model model) throws Exception {
		int m_code = ((MemberDTO) session.getAttribute("login")).getM_code();
		
		// List<ActorDTO> list = preferService.preferActorList(m_code); // 그냥 목록
		List<ActorDTO> list = preferService.preferActorPaging(m_code, pdto); // 페이징 목록
		Pagination pagination = new Pagination(pdto);
		pagination.setTotalCnt(preferService.preferActorCount(m_code));
		
		model.addAttribute("list", list);
		model.addAttribute("paging", pagination);
		return "prefer/preferList";
	}
	
	// 찜한 배우 삭제
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam("a_id") int a_id) throws Exception {
		preferService.deletePrefer(a_id);
		return "redirect:/prefer/list"; // 선호배우 목록으로 리다이렉트
	}
}
