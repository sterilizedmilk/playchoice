package com.playchoice.play.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.playchoice.admin.dto.AreaDTO;
import com.playchoice.admin.dto.GenreDTO;
import com.playchoice.play.dto.PlayDTO;
import com.playchoice.play.dto.PlayMenuDTO;
import com.playchoice.play.service.PlayServiceImpl;

/**
 * 연극 목록, 검색, 정보 열람, 예매
 */
@Controller
@RequestMapping("/play")
public class PlayController {

	@Autowired
	private PlayServiceImpl service;

	private static final Logger logger = LoggerFactory.getLogger(PlayController.class);

	// 전체 일정
	// 메뉴에서 장르나 지역의 경우, 0이면 전체 보기
	@ModelAttribute("area")
	public List<AreaDTO> getAreaList() {
		// 메뉴 상단에 있는 지역 관련
		return service.getAreaList();
	}

	@ModelAttribute("genre")
	public List<GenreDTO> getGenreList() {
		// 메뉴 상단에 있는 장르 관련
		return service.getGenreList();
	}

	// 전체 일정
	@RequestMapping("mainlist")
	public String playListController(HttpServletRequest request, Model model,
			/*
			 * @RequestParam(value = "a_id", required = false, defaultValue = "0") int a_id,
			 * 
			 * @RequestParam(value = "g_id", required = false, defaultValue = "0") int g_id,
			 * 
			 * @RequestParam(value = "s_tab", required = false, defaultValue = "0") String
			 * s_tab,
			 */
			PlayMenuDTO menudto) throws Exception {

		// PlayMenuDTO menudto = new PlayMenuDTO();
		// menudto.setA_id(a_id);
		// menudto.setG_id(g_id);
		List<PlayDTO> dto;
		HttpSession session;
		SimpleDateFormat sdf;

		switch (menudto.getS_tab()) {
		case "mainlist":
			menudto.setS_tab("mainlist");
			dto = service.playList(menudto);
			model.addAttribute("list", dto);
			model.addAttribute("title", "전체리스트");

			break;
		case "todaylist":
			menudto.setS_tab("todaylist");
			session = request.getSession();
			sdf = new SimpleDateFormat("yyyy-MM-dd");
			model.addAttribute("title", "오늘 리스트");

			if (session.getAttribute("date") instanceof Date) {
				Date date = (Date) session.getAttribute("date");

				String res = sdf.format(date);

				dto = service.playTodayList(res);
				model.addAttribute("list", dto);
			}
			break;
		case "tomorrowlist":
			menudto.setS_tab("tomorrowlist");
			session = request.getSession();
			sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();

			if (session.getAttribute("date") instanceof Date) {

				Date date = (Date) session.getAttribute("date");

				cal.setTime(date);
				cal.add(Calendar.DATE, 1);

				String res = sdf.format(cal.getTime());
				dto = service.playTodayList(res);
				model.addAttribute("list", dto);
			}
			model.addAttribute("title", "내일 리스트");
			break;
		}
		model.addAttribute("menudto", menudto);

		return "play/playlist";
	}

	// 오늘일정
	@RequestMapping("todaylist")
	public String playTodaylist(HttpServletRequest request, Model model,
			@RequestParam(value = "a_id", required = false, defaultValue = "0") int a_id,
			@RequestParam(value = "g_id", required = false, defaultValue = "0") int g_id) throws Exception {
		PlayMenuDTO menudto = new PlayMenuDTO();
		menudto.setA_id(a_id);
		menudto.setG_id(g_id);
		menudto.setS_tab("todaylist");

		model.addAttribute("playMenu", menudto);

		HttpSession session = request.getSession();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		if (session.getAttribute("date") instanceof Date) {
			Date date = (Date) session.getAttribute("date");

			String res = sdf.format(date);

			List<PlayDTO> dto = service.playTodayList(res);
			model.addAttribute("list", dto);

		}
		model.addAttribute("title", "오늘 리스트");
		return "play/playlist";
	}

	// 내일일정
	@RequestMapping("tomorrowlist")
	public String playTomorrowlist(HttpServletRequest request, Model model,
			@RequestParam(value = "a_id", required = false, defaultValue = "0") int a_id,
			@RequestParam(value = "g_id", required = false, defaultValue = "0") int g_id) throws Exception {

		PlayMenuDTO menudto = new PlayMenuDTO();
		menudto.setA_id(a_id);
		menudto.setG_id(g_id);
		menudto.setS_tab("tomorrowlist");

		model.addAttribute("playMenu", menudto);

		HttpSession session = request.getSession();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();

		if (session.getAttribute("date") instanceof Date) {

			Date date = (Date) session.getAttribute("date");

			cal.setTime(date);
			cal.add(Calendar.DATE, 1);

			String res = sdf.format(cal.getTime());
			List<PlayDTO> dto = service.playTodayList(res);
			model.addAttribute("list", dto);
		}
		model.addAttribute("title", "내일 리스트");
		return "play/playlist";
	}

	// 연극 detail
	@RequestMapping(value = "playdetail", method = RequestMethod.GET)
	public String playDetail(@RequestParam("p_id") int p_id, Model model) throws Exception {
		// play
		model.addAttribute("playDTO", service.playDetail(p_id));

		// schedule
		model.addAttribute("schedule", service.getSchedule(p_id));

		// review
		model.addAttribute("reviewScore", service.getReviewScore(p_id));
		model.addAttribute("reviewSmall", service.getReviewSmall(p_id));

		// Q & A
		model.addAttribute("qnaAll", service.getQnA(p_id));
		return "play/playdetail";

	}

	// 장바구니
	@RequestMapping("bastket")
	public void addBastket(@RequestParam HashMap<String, Object> param) {
		// TODO 쿠키적용
		System.out.println(param);
	}

	// 결제
	@RequestMapping("payment")
	public void directPay(@RequestParam HashMap<String, Object> param) {
		// TODO 로그인여부 확인(인터셉터)
		System.out.println(param);
	}
}