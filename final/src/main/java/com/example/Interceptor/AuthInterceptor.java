package com.example.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		if(request.getSession().getAttribute("u_id")==null && request.getSession().getAttribute("c_id")==null && request.getSession().getAttribute("token")==null) {
			String path=request.getServletPath(); //원래 가고자했던 url주소
			String query=request.getQueryString();//?뒤로 가지고 오는 값들
			if(query!=null) {
				query="?"+query;
			}else {
				query="";
			}
			
			//System.out.println(path+query);
			request.getSession().setAttribute("dest", path+query); //원래가고자 했던 url을 세션에 저장
			
			System.out.println(path+query);
			response.sendRedirect("/user/login");
		}
		return super.preHandle(request, response, handler);
	}
	
	
}
