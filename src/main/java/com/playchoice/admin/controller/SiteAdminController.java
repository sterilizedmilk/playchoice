package com.playchoice.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.playchoice.actor.dto.ActorDTO;
import com.playchoice.admin.dto.AreaDTO;
import com.playchoice.admin.dto.GenreDTO;
import com.playchoice.admin.service.SiteAdminService;
import com.playchoice.member.dto.MemberDTO;

/**
 * 사이트 관리자 메뉴 사용자 관리, 배우 관리...
 */
@Controller
@RequestMapping("admin/site")
public class SiteAdminController {

	@Autowired
	SiteAdminService adminService;

	@RequestMapping("")
	public String adminMainController() {
		System.out.println("관리자 페이지 입성");
		return "admin/site/integratedpage";
	}

	// -----------------------------멤버----------------------------------------
	// 멤버 전체 리스트 가져오기
	@RequestMapping("member/common")
	public String memberCommonController(Model model) {
		Object obj = adminService.memberListAll();

		model.addAttribute("memberlist", obj);
		return "admin/site/member/common";
	}

	@RequestMapping("member/playadmin")
	public String memberPlayAdminController() {
		return "admin_member";
	}

	@RequestMapping(value = "member/modify", method = RequestMethod.POST)
	public String memberModifyController(MemberDTO dto, Model model) {
		adminService.memberUpdate(dto);
		return "redirect:/admin/site/member/common";
	}

	@RequestMapping(value = "member/delete", method = RequestMethod.POST)
	public String memberDeleteController(MemberDTO dto, Model model) {
		adminService.memberDelete(dto);
		dto.setM_status(3);
		return "redirect:/admin/site/member/common";
	}

	@RequestMapping(value = "member/black", method = RequestMethod.POST)
	public String memberBlackController(MemberDTO dto, Model model) {
		if (dto.getM_status() == 1)
			dto.setM_status(0);
		else if(dto.getM_status() == 0)
			dto.setM_status(1);
				
		adminService.memberblack(dto);
		return "redirect:/admin/site/member/common";
	}

	// ajax
	@RequestMapping("member/Black")
	public ResponseEntity<String> memberBlackController(@RequestParam("id") int m_id) {

		return null;
	}

	// ajax
	@RequestMapping("member/unBlack")
	public ResponseEntity<String> memberUnBlackController(@RequestParam("id") int m_id) {

		return null;
	}

	//

	// -----------------------------배우----------------------------------------
	// 배우 전체 리스트 가져오기
	@RequestMapping("actor/common")
	public String ActorController(Model model) {
		Object obj = adminService.actorListAll();

		model.addAttribute("actorlist", obj);
		return "admin/site/actor/common";
	}

	// @RequestMapping(value = "actor/add", method = RequestMethod.GET)
	// public String addActorFormController() {
	//
	// return "";
	// }
	//
	// @RequestMapping(value = "actor/add", method = RequestMethod.POST)
	// public String addActorActionController() {
	// return "";
	// }

	@RequestMapping(value = "actor/update", method = RequestMethod.POST)
	public String updateActorActionController(ActorDTO dto, Model model) {
		System.out.println(adminService.actorUpdate(dto));
		return "redirect:/admin/site/actor/common";
	}

	@RequestMapping(value = "actor/delete", method = RequestMethod.POST)
	public String deleteActorActionController(ActorDTO dto, Model model) {
		if (dto.getA_deleted() == 1)
			dto.setA_deleted(0);
		else
			dto.setA_deleted(1);
		adminService.actorDelete(dto);
		return "redirect:/admin/site/actor/common";
	}

	// -----------------------------연극----------------------------------------
	@RequestMapping("play/common")
	public String playListController() {
		return "";
	}

	@RequestMapping("play/detail")
	public String playDetailController(@RequestParam("id") int p_id) {

		return "";
	}

	@RequestMapping("play/detach")
	public String playDetachController(@RequestParam("id") int p_id) {
		return "";
	}

	/*
	 * @RequestMapping("notice") public String
	 * noticeListController(@RequestParam(value = "page", defaultValue = "1") int
	 * page) { return ""; }
	 * 
	 * @RequestMapping("notice/detail") public String
	 * noticeDetailController(@RequestParam int no) {
	 * 
	 * return ""; }
	 * 
	 * @RequestMapping("notice/update") public String
	 * noticeUpdateController(@RequestParam int no) {
	 * 
	 * return ""; }
	 * 
	 * @RequestMapping("notice/write") public String noticeWriteController() {
	 * 
	 * return ""; }
	 * 
	 * @RequestMapping(value = "notice/delete", method = RequestMethod.POST) //
	 * post? public String noticeDeleteController() {
	 * 
	 * return ""; }
	 * 
	 * @RequestMapping("FAQ") public String FAQListController(@RequestParam(value =
	 * "page", defaultValue = "1") int page) { return ""; }
	 * 
	 * @RequestMapping("FAQ/detail") public String FAQDetailController(@RequestParam
	 * int no) { return ""; }
	 * 
	 * @RequestMapping("FAQ/update") public String FAQUpdateController(@RequestParam
	 * int no) { return ""; }
	 * 
	 * @RequestMapping("FAQ/write") public String FAQWriteController() { return "";
	 * }
	 * 
	 * @RequestMapping("FAQ/delete") public String FAQDeleteController() { return
	 * ""; }
	 * 
	 * @RequestMapping("contact") public String
	 * contactListController(@RequestParam(value = "page", defaultValue = "1") int
	 * page) { return ""; }
	 * 
	 * @RequestMapping("contact/detail") public String
	 * contactDetailController(@RequestParam int no) { return ""; }
	 * 
	 * @RequestMapping("contact/update") public String
	 * contactUpdateController(@RequestParam int no) { return ""; }
	 * 
	 * @RequestMapping("contact/answer") public String
	 * contactWriteController(@RequestParam int no) { return ""; }
	 * 
	 * @RequestMapping("contact/delete") public String contactDeleteController() {
	 * return ""; }
	 */
	// -----------------------------장르----------------------------------------
	@RequestMapping("genre")
	public String genreListController(Model model) {
		List<GenreDTO> genreList = adminService.genreList();
		model.addAttribute("genreList", genreList);
		return "admin/site/genre";
	}

	@RequestMapping(value = "genre/add", method = RequestMethod.POST)
	public ResponseEntity<String> genreAddController(@RequestParam String g_name) {
		ResponseEntity<String> entity = new ResponseEntity<String>(HttpStatus.OK);
		int result = adminService.genreInsert(g_name);

		if (result == 1)
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		else
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value = "genre/edit", method = RequestMethod.POST)
	public ResponseEntity<String> genreEditController(GenreDTO dto) {
		ResponseEntity<String> entity = new ResponseEntity<String>(HttpStatus.OK);
		int result = adminService.genreUpdate(dto);

		if (result == 1)
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		else
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		return entity;
	}

	// -----------------------------지역----------------------------------------
	@RequestMapping("area")
	public String areaListController(Model model) {
		List<AreaDTO> areaList = adminService.areaList();
		model.addAttribute("areaList", areaList);
		return "admin/site/area";
	}

	@RequestMapping(value = "area/add", method = RequestMethod.POST)
	public ResponseEntity<String> areaAddController(@RequestParam String a_name) {
		ResponseEntity<String> entity = new ResponseEntity<String>(HttpStatus.OK);
		int result = adminService.areaInsert(a_name);

		if (result == 1)
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		else
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping(value = "area/edit", method = RequestMethod.POST)
	public ResponseEntity<String> areaEditController(AreaDTO dto) {
		ResponseEntity<String> entity = new ResponseEntity<String>(HttpStatus.OK);
		int result = adminService.areaUpdate(dto);

		if (result == 1)
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		else
			entity = new ResponseEntity<String>("FAILED", HttpStatus.OK);
		return entity;
	}

	
	

}
