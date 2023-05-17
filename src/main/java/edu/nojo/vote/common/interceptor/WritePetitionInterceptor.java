package edu.nojo.vote.common.interceptor;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import edu.nojo.vote.user.model.dto.User;
import edu.nojo.vote.writePetition.model.dto.PetitionCategory;
import edu.nojo.vote.writePetition.model.service.WritePetitionService;

public class WritePetitionInterceptor implements HandlerInterceptor{
	@Autowired
	private WritePetitionService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		ServletContext application = request.getServletContext();
		if(application.getAttribute("defaultCategoryList") == null) {
//			System.out.println("카테고리리스트불러오기!");
			List<PetitionCategory> categoryList = service.selectPetitionCategoryList();
			application.setAttribute("defaultCategoryList", categoryList);
//			System.out.println(categoryList);
		}
		
		
//		// 임시로 로그인
//		if(application.getAttribute("loginUser") == null) {
//			application.setAttribute("loginUser", new User(1, "user01@kh.or.kr", "", "유저일", "resources/images/user/dog1.jpg"));
//		}
		
		
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
}