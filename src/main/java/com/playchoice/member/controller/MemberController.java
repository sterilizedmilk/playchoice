package com.playchoice.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.playchoice.member.dto.MemberDTO;
import com.playchoice.member.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	//로그인 페이지이동
	@RequestMapping("login")
	public String loginGO(HttpSession session) {
		//세션 존재하는지 체크
		if(session.getAttribute("loginInfo")!=null) {
			return "redirect:/";
		}
		
		return "member/loginPage";
	}
	
	//로그인
	@RequestMapping(value="loginGo", method=RequestMethod.POST)
	public String loginChk(
			Model model
			, @ModelAttribute MemberDTO dto
			, HttpSession session) throws Exception{
		MemberDTO loginInfo = (MemberDTO) memberService.loginMember(dto);
		
		if(loginInfo != null) {
			//비밀번호 삭제
			loginInfo.setM_pw("");
			//객체 세션 추가
			session.setAttribute("loginInfo", loginInfo);
			
			switch(loginInfo.getM_sep()) {
			//사용자
			case 0 :
				model.addAttribute("msg", "로그인 성공");
				model.addAttribute("url","/web");
				return "member/loginAlert";
			//연극관리자
			case 1 :
				return "home2";
			//사이트관리자
			case 2 :
				return "home3";
			}
		}else {
			model.addAttribute("msg", "아이디와 비밀번호를 확인해주세요");
			model.addAttribute("url","login");
			return "member/loginAlert";
			
		}

		return "redirect:/ ";
	}
	
	//로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//아이디 찾기 페이지이동
	@RequestMapping(value="findId", method=RequestMethod.GET)
	public String findId() {
		
		return "member/findId";
	}
	
	//아이디찾기
	@RequestMapping(value="findId", method=RequestMethod.POST)
	public String findIdGo(@ModelAttribute MemberDTO dto,
			Model model) {

		if(memberService.findId(dto).equals("fail")) {
			model.addAttribute("msg", "일치하는 아이디가 없습니다.");
			model.addAttribute("url","login");
			return "member/loginAlert";
		}else {
			model.addAttribute("m_id", memberService.findId(dto));
			return "member/findIdResult";
		}
		
	}
	
	//비밀번호 찾기 페이지이동
	@RequestMapping(value="findPw", method=RequestMethod.GET)
	public String findPw() {
		
		return "member/findPw";
	}
	
	//비밀번호 찾기(임의 난수 6자 출력)
	@RequestMapping(value="findPw", method=RequestMethod.POST)
	public String findPwGo(@ModelAttribute MemberDTO dto,
			Model model) {
		
		String res = memberService.findPw(dto);
		if(res.equals("fail")) {
			model.addAttribute("msg", "아이디와 이메일을 확인하세요.");
			model.addAttribute("url","login");
			return "member/loginAlert";
		}else {
			model.addAttribute("m_pw", res);
			return "member/findPwResult";
		}
		
	}
}
