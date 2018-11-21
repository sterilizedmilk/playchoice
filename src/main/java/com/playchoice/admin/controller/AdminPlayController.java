package com.playchoice.admin.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.playchoice.admin.service.AdminPlayService;
import com.playchoice.admin.service.FileService;
import com.playchoice.play.dto.PlayDTO;


/**
 * 연극 관리자 메뉴
 * 연극 추가, 연극 정보 수정, 정산
 */
@Controller
@RequestMapping("admin/play")
public class AdminPlayController {
	
	@Autowired
	private AdminPlayService service;
	
	
	private static final Logger logger = LoggerFactory.getLogger(AdminPlayController.class);
	
	//리스트
	@RequestMapping(value="aplist", method=RequestMethod.GET)
	public void listAll(Model model) throws Exception{
		logger.info("list all show....................");
		model.addAttribute("list", service.listAll());
	}
	
	//조회
	@RequestMapping(value="apread", method=RequestMethod.GET)
	public void read(@RequestParam("p_id") int p_id, Model model) throws Exception{
		logger.info("list read show....................");
		model.addAttribute(service.read(p_id));
	}
	
	//생성
	@RequestMapping(value="apregister", method=RequestMethod.GET)
	public void registerGET(PlayDTO dto, Model model) throws Exception{
		logger.info("register get.............");
	}

	@RequestMapping(value="apregister", method=RequestMethod.POST)
	public String register(@RequestParam HashMap<String, Object> param,
			@RequestParam("p_picture") MultipartFile file,
			MultipartHttpServletRequest request, RedirectAttributes rttr) throws Exception{
		FileService fs = new FileService();
		
		if(fs.isImgChk(file)) {
			if(file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
				//파일업로드
				param.put("p_picture", fs.fileUpload(file, request));
			}else {
				//기본 프로필 사진으로 DB 저장
				param.put("p_picture", "default.png");
			}
			//DB insert
			service.regist(param);
			
			rttr.addFlashAttribute("msg", "success");
			return "redirect:/admin/play/aplist";
		}else {
			System.out.println("이미지 파일 오류");
			return "";
		}
	}

	//수정
	@RequestMapping(value="modify", method=RequestMethod.GET)
	public void modifyGET(int p_id, Model model) throws Exception{
		model.addAttribute(service.read(p_id));
	}
	@RequestMapping(value="modify", method=RequestMethod.POST)
	public String modifyPOST(@RequestParam HashMap<String, Object> param,
			@RequestParam("p_picture") MultipartFile file,
			MultipartHttpServletRequest request, RedirectAttributes rttr) throws Exception{
		logger.info("mod post............");
		FileService fs = new FileService();
		
		if(fs.isImgChk(file)) {
			if(file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
				//파일업로드
				param.put("p_picture", fs.fileUpload(file, request));
			}else {
				//기본 프로필 사진으로 DB 저장
				param.put("p_picture", "default.png");
			}
			//DB insert
			service.modify(param);
			rttr.addFlashAttribute("msg", "success");
			return "redirect:/admin/play/aplist";
		}else {
			System.out.println("이미지 파일 오류");
			return "";
		}
	}
	
	
	//삭제
	@RequestMapping(value="remove", method=RequestMethod.POST)
	public String remove(@RequestParam("p_id")int p_id, RedirectAttributes rttr) throws Exception{
		service.remove(p_id);
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/admin/play/aplist";
	}
	
	//게시
	@RequestMapping(value="flurry", method=RequestMethod.POST)
	public String flurry(@RequestParam("p_id")int p_id, RedirectAttributes rttr) throws Exception{
		service.flurry(p_id);
		
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/admin/play/aplist";
	}
	

//	@RequestMapping("aplist") // 연극 관리자 연극 리스트 보기 호출
//	public String apList(HttpSession ses, Model model) {
//		Object a = ses.getAttribute("user_id"); //user_id 관련 들고 들어오다
//		List<PlayDTO> plays = (List<PlayDTO>) session.selectList("queryurl", a); //mapper에 설정되어있다 -> list에 입력
//		model.addAttribute("playList", plays); //playList 
//		
//		return "";
//	}
	
	
}
