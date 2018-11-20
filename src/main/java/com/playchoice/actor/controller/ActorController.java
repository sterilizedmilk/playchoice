package com.playchoice.actor.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.playchoice.actor.service.ActorService;
import com.playchoice.common.FileService;
import com.playchoice.member.dto.MemberDTO;


/**
 * 배우 정보 열람/검색 및 찜하기
 */
@Controller
@RequestMapping("actor")
public class ActorController {
	
	@Autowired
	ActorService service;

	
	// 배우 목록/검색
	@RequestMapping(value = "list", method=RequestMethod.GET)
	public String actorListController(@RequestParam(required = false) String keyword
			, Model model){
		model.addAttribute("actorList",service.listActor(keyword));

		return "actor/actorList";
	}
	
	// 배우 정보
	@RequestMapping("detail")
	public String actordetailController() {
		return "";
	}
	
	//배우등록 페이지이동
	@RequestMapping("insertActor")
	public String insertActor() {
		return "actor/insertActor";
	}
	
	//배우등록하기
	@RequestMapping(value="insertActor", method=RequestMethod.POST)
	public String insertActorSubmit(@RequestParam HashMap<String, Object> param
			,@RequestParam("a_picture") MultipartFile file
			,MultipartHttpServletRequest request
			,Model model) throws IOException {
		FileService fs = new FileService();
		
		if(fs.isImgCheck(file)) {
		//파일 등록 유무 확인
		if(file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")){
			//파일업로드
			param.put("a_picture", fs.fileUpload(request, file));
		}else {
			//기본 프로필사진으로 DB저장
			param.put("a_picture", "default.jpg");
		}
		//DB insert
		service.insertActor(param);
			
		return "redirect:/actor/list";
		}else {
			System.out.println("이미지파일아님");
			return "";
		}
	}
	
	//배우 찜하기 아직못했음
	@RequestMapping(value="mypick", method=RequestMethod.POST)
	public void mypickActor(String a_id, HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		System.out.println(dto.getM_code());
		System.out.println(a_id);
		
		service.mypickActor(dto, a_id);
	}
	
}
