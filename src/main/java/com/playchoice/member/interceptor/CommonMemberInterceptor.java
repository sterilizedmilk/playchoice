package com.playchoice.member.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.playchoice.member.dto.MemberDTO;

public class CommonMemberInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("login");
		if (obj == null) {
			response.sendRedirect(request.getContextPath() + "/member/login");
			return false;
		}
		MemberDTO login = (MemberDTO) obj;
		
		if (login.getM_level() >= 0)
			return true;
		
		// 여기까지 올 일 없음
		response.sendRedirect(request.getContextPath() + "/member/noAuthority");
		return false;
	}

}
