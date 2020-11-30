package com.bit.backpackers.member.Interceptor;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bit.backpackers.member.model.entity.MemberVo;



public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession();
		MemberVo user = (MemberVo)session.getAttribute("user");
	
		// 로그인하지 않은 경우
		if(user == null) {
			// ajax 요청인 경우
			if(isAjaxRequest(request)) {
				response.sendError(400);
				return false;
			}
			response.sendRedirect("/backpackers/user/login");
			return false;
		}
		
		return true;
		
	}
	
	private boolean isAjaxRequest(HttpServletRequest request) {
		String header = request.getHeader("ajax-need-login");
		if("true".equals(header)) {
			return true;
		}
		return false;
	}
}