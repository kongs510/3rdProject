package com.bit.backpackers.member.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.bit.backpackers.member.model.entity.MemberVo;



public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		HttpSession session = request.getSession();
		MemberVo user = (MemberVo)session.getAttribute("user");
	
		// 관리자가 아닌 경우
//		if(user.getGrade() != 1) {
//			response.sendRedirect("/backpackers");
//			return false;
//		}
		
		return true;
		
	}
}