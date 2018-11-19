package com.playchoice.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.playchoice.member.dto.LoginDTO;
import com.playchoice.member.dto.MemberDTO;
import com.playchoice.member.service.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {

	@Autowired
	MemberService memberService;

	// 회원 가입 페이지로 이동
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertGET() throws Exception {
		return "member/insertForm";
	}

	// 회원 가입 처리
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPOST(MemberDTO memberDto, Model model) throws Exception {
		memberService.insertMember(memberDto);
		// TODO : 로그인 처리
		model.addAttribute("member", memberDto);
		return "member/insertResult";
	}

	// 로그인 페이지로 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() throws Exception {
		return "member/loginForm";
	}
	
	/*// 로그인 페이지이동
	@RequestMapping("/login")
	public String loginGO(HttpSession session) {
		// 세션 존재하는지 체크
		if (session.getAttribute("loginInfo") != null) {
			return "redirect:/"; // 전 페이지로 이동
		}
		return "member/loginPage";
	}*/
	
	// 로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(LoginDTO dto, HttpServletRequest request) throws Exception{
		//System.out.println(dto.toString());
		MemberDTO memberDto = memberService.loginMember(dto);
		if(memberDto == null) {
			System.out.println("로그인 실패");
			return "redirect:/member/login";
		}
		memberDto.setM_pw(""); // 비밀번호 삭제
		HttpSession session = request.getSession(); // 세션에 로그인 정보 넣기
		session.setAttribute("login", memberDto);
		
		switch(memberDto.getM_level()) {
		case 0 : // 일반회원
			return "redirect:/";
		case 1 : // 연극 관리자
			System.out.println("연극관리자 로그인");
			return "";
		case 2 : // 사이트 관리자
			System.out.println("사이트관리자 로그인");
			return "";
		}
		return "redirect:/"; // (수정필요)
	}

	/*// 로그인
	@RequestMapping(value = "/loginGo", method = RequestMethod.POST)
	public String loginChk(Model model, @ModelAttribute MemberDTO dto, HttpSession session) throws Exception {
		MemberDTO loginInfo = (MemberDTO) memberService.loginMember(dto);

		if (loginInfo != null) {
			// 비밀번호 삭제
			loginInfo.setM_pw("");
			// 객체 세션 추가
			session.setAttribute("loginInfo", loginInfo);

			switch (loginInfo.getM_level()) {
			// 사용자
			case 0:
				model.addAttribute("msg", "로그인 성공");
				model.addAttribute("url", "/web");
				return "member/loginAlert";
			// 연극관리자
			case 1:
				return "home2";
			// 사이트관리자
			case 2:
				return "home3";
			}
		} else {
			model.addAttribute("msg", "아이디와 비밀번호를 확인해주세요");
			model.addAttribute("url", "login");
			return "member/loginAlert";
		}
		return "redirect:/ ";
	}*/

	// 로그아웃 처리
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		HttpSession session = request.getSession();
		// session.invalidate(); // 세션 정보 완전 삭제
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		if(dto == null ) {
			return "redirect:/member/login";
		}
		session.removeAttribute("login"); // 세션에 로그인 정보 삭제
		//rttr.addFlashAttribute("msg", "로그아웃");
		return "redirect:/"; // (수정필요) 보고있는 페이지를 새로고침 해줘야함
	}
	
	/*// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}*/
	
	// 아이디 찾기 페이지로 이동
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String findId() {
		return "member/findId";
	}

	// 아이디 찾기 처리
	@RequestMapping(value = "findId", method = RequestMethod.POST)
	public String findIdGo(@ModelAttribute MemberDTO dto, Model model) {
		if (memberService.findId(dto).equals("fail")) {
			model.addAttribute("msg", "일치하는 아이디가 없습니다.");
			model.addAttribute("url", "login");
			return "member/loginAlert";
		} else {
			model.addAttribute("m_id", memberService.findId(dto));
			return "member/findIdResult";
		}
	}

	// 비밀번호 찾기 페이지로 이동
	@RequestMapping(value = "findPw", method = RequestMethod.GET)
	public String findPw() {
		return "member/findPw";
	}

	// 비밀번호 찾기 처리 ==> 임의 난수 6자로 비밀번호 변경
	@RequestMapping(value = "findPw", method = RequestMethod.POST)
	public String findPwGo(@ModelAttribute MemberDTO dto, Model model) {
		String res = memberService.findPw(dto);
		if (res.equals("fail")) {
			model.addAttribute("msg", "아이디와 이메일을 확인하세요.");
			model.addAttribute("url", "login");
			return "member/loginAlert";
		} else {
			model.addAttribute("m_pw", res);
			return "member/findPwResult";
		}
	}
	
	// 회원 정보 페이지로 이동
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String viewGET(@RequestParam(value="m_id", required=false) String m_id, HttpSession session, Model model) throws Exception {
		//MemberDTO dto = memberService.viewMember(m_id);
		//model.addAttribute("dto", dto);
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		model.addAttribute("dto", dto);
		return "/member/viewForm";
	}
	
	// 회원 정보 수정 페이지로 이동
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateGET(HttpSession session, Model model) throws Exception {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		model.addAttribute("dto", dto);
		return "/member/updateForm";
	}
	
	// 회원 정보 수정 처리
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePOST(@ModelAttribute MemberDTO dto, HttpSession session, RedirectAttributes rttr) throws Exception {
		// 비밀번호 체크
		boolean result = memberService.checkPw(dto.getM_id(), dto.getM_pw());
		if(result) { // 비밀번호가 일치하면 수정 처리 후, 메인페이지로 리다이렉트
			memberService.updateMember(dto);
			dto.setM_pw("");
			session.setAttribute("login", dto);
			return "redirect:/";
		} else { // 비밀번호가 일치하지 않는다면, div에 불일치 문구 출력 후 viewForm.jsp로 포워드
			rttr.addFlashAttribute("msg", "비밀번호 불일치");
			return "redirect:/member/view";
		}
	}
	
	// 비밀번호 변경 페이지로 이동
	@RequestMapping(value = "/updatePw", method = RequestMethod.GET)
	public String updatePwGET() throws Exception {
		return "/member/updatePwForm";
	}
	
	// 비밀번호 변경 처리
	@RequestMapping(value = "/updatePw", method = RequestMethod.POST)
	public String updatePwPOST(@ModelAttribute MemberDTO dto, HttpSession session, RedirectAttributes rttr) throws Exception {
		boolean result = memberService.checkPw(dto.getM_id(), dto.getM_pw());
		if(result) {
			memberService.updateMember(dto);
			dto.setM_pw("");
			session.setAttribute("login", dto);
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("msg", "비밀번호 불일치");
			return "redirect:/member/view";
		}
	}
	
	// 회원 탈퇴 페이지로 이동
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteGET(HttpSession session, Model model) throws Exception {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		model.addAttribute("dto", dto);
		return "/member/deleteForm";
	}
	
	// 회원 탈퇴 처리
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String deletePOST(@RequestParam("m_id") String m_id, @RequestParam("m_pw") String m_pw, HttpSession session, Model model) throws Exception {
		// 비밀번호 체크
		boolean result = memberService.checkPw(m_id, m_pw);
		if(result) { // 비밀번호가 일치하면 삭제 처리 후, 메인페이지로 리다이렉트
			memberService.deleteMember(m_id);
			session.invalidate();
			return "redirect:/";
		} else { // 비밀번호가 일치하지 않는다면, div에 불일치 문구 출력 후 deleteForm.jsp로 포워드
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다");
			model.addAttribute("dto", memberService.viewMember(m_id));
			return "member/deleteForm";
		}
	}

	// 아이디 중복체크 AJAX 처리
	@ResponseBody
	@RequestMapping(value = "/duplicate/{m_id}", method = RequestMethod.POST)
	public ResponseEntity<String> duplicateId(@PathVariable("m_id") String m_id) throws Exception {
		ResponseEntity<String> entity = null;
		try {
			if (memberService.duplicateId(m_id)) { // 아이디 중복 되는 경우
				entity = new ResponseEntity<String>("DUPLICATED", HttpStatus.OK);
			} else { // 사용가능한 경우
				entity = new ResponseEntity<String>("AVAILABLE", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
