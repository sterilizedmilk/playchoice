package com.playchoice.member.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.playchoice.member.dto.MemberDTO;

//로그인 처리를 담당하는 인터셉터
public class UserInterceptor extends HandlerInterceptorAdapter {
	// 컨트롤러 보다 먼저 수행되는 메서드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 세션 정보 가져오기
		HttpSession session = request.getSession();
		// 로그인 처리르 담당하는 사용자 정보를 담고 있는 객체 가져오기
		MemberDTO dto = (MemberDTO) session.getAttribute("login");

		// session 정보가 없을 경우 로그인 페이지로 이동
		if (dto == null) {
			response.sendRedirect(request.getContextPath() + "/member/login");
			return false;
		}
		// 0: 일반 , 1 : 연극 관리자 , 2: 사이트 관리자
		else {
			switch (dto.getM_level()) {
			case 0:
				response.sendRedirect(request.getContextPath());
				System.out.println("일반 회원");
				return true;
			case 1:
				response.sendRedirect(request.getContextPath() + "/admin/play/aplist");
				System.out.println("연극 관리자");
				return true;
			case 2:
				response.sendRedirect(request.getContextPath() + "/admin/site");
				System.out.println("사이트 관리자");
				return true;
			default:
				return false;
			}
		}
	}

	// 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
}
