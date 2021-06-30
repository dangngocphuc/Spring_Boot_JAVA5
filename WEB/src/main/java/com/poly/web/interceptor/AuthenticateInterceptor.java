package com.poly.web.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.poly.web.entity.User;

@Component
public class AuthenticateInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(
		HttpServletRequest request,
		HttpServletResponse response,
		Object handler
	) throws IOException {
		HttpSession session = request.getSession();
		
		if ( session.getAttribute("user") == null ) {
			session.setAttribute("error", "Vui lòng đăng nhập");
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		return true;
	}
}
