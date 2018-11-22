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
import com.playchoice.admin.service.SiteAdminService;
import com.playchoice.play.dto.PlayDTO;
import com.playchoice.schedule.dto.ScheduleDTO;


/**
 * 연극 관리자 메뉴
 * 연극 추가, 연극 정보 수정, 정산
 */
@Controller
@RequestMapping("admin/play")
public class AdminPlayController {
	
	@Autowired
	private AdminPlayService service;
	
	@Autowired
	private SiteAdminService service2;
	
	
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
		service2.genreList();
		service2.areaList();
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
	
	//일정 조회
	@RequestMapping(value="pslist", method=RequestMethod.GET)
	public void psread(@RequestParam("p_id") int p_id, Model model) throws Exception{
		logger.info("list psread show....................");
		model.addAttribute("key", service.psread(p_id));
		//key 값을 key로 만들어 service.psread(p_id) 내용을 사용
		System.out.println(service.psread(p_id));
	}
	
	//일정 생성
	@RequestMapping(value="psregister", method=RequestMethod.GET)
	public void psregisterGET(ScheduleDTO sdto, Model model) throws Exception{
		logger.info("psregister get.............");
		System.out.println(sdto);
	}
	@RequestMapping(value="psregister", method=RequestMethod.POST)
	public String psregisterPOST(ScheduleDTO sdto, RedirectAttributes rttr) throws Exception{
		logger.info("psregister post.............");
		
		System.out.println(sdto);
		System.out.println(sdto.getP_id());
		service.psregist(sdto);
		rttr.addAttribute("msg", "success");
		
		return "redirect:pslist?p_id="+sdto.getP_id();
		//pslist로 이동 ->  p_id에 대하여 sdto.getP_id() 로 이동
	}

	
}
