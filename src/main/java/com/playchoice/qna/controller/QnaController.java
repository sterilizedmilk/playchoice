package com.playchoice.qna.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.playchoice.member.dto.MemberDTO;
import com.playchoice.qna.dto.QnaDTO;
import com.playchoice.qna.service.QnaService;
@Controller
@RequestMapping("qna")
public class QnaController {

	@Autowired
	QnaService service;
	
	//QnA 등록하기
	@RequestMapping(value="insertQues", method=RequestMethod.POST)
	String insertQues(@RequestParam HashMap<String, Object> res,
			Model model) {
		//TODO <br>로 변환하기
		if(res.get("m_code") != null && res.get("m_code") != "") { //로그인 여부 검사
			if(service.insertQuset(res) != 1) { // INSERT 결과 확인
				model.addAttribute("msg", "등록실패");
				model.addAttribute("url", "../play/playdetail?p_id="+res.get("p_id"));
			}else {
				model.addAttribute("msg", "등록완료");
				model.addAttribute("url", "../play/playdetail?p_id="+res.get("p_id"));
			}
		}else {
			model.addAttribute("msg", "로그인해주세요");
			model.addAttribute("url", "../play/playdetail?p_id="+res.get("p_id"));
		}
		return "qna/result";
	}
	
	//QnA 삭제하기 - 질문을 삭제하면 답변도 삭제됩니다.
	@RequestMapping(value="delete")
	Object deleteQues(HttpServletRequest request
			,QnaDTO dto
			,Model model) {
		model.addAttribute("msg", "삭제실패");
		model.addAttribute("url", "../play/playdetail?p_id="+dto.getP_id());
		
		//세션값 가져오기
		HttpSession session = request.getSession();
		
		MemberDTO res = (MemberDTO)session.getAttribute("login");
		if(res != null) { //세션 체크
			if(res.getM_code() == dto.getM_code() || res.getM_level() == 3) { // 작성자 일치 / 관리자인지 확인
				if(service.deleteQna(dto)>=1){ // 삭제
					model.addAttribute("msg", "삭제성공");
				}
				else {
					model.addAttribute("msg", "삭제실패");
				}
			}else
				model.addAttribute("msg", "권한이 없습니다.");
		}else {
			model.addAttribute("msg", "로그인이 필요합니다.");
		}

		return "qna/result";	
	}
	
}