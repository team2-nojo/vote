package edu.nojo.vote.common.interceptor;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import edu.nojo.vote.browse.model.dto.BrowsePetition;
import edu.nojo.vote.browse.model.service.PetitionService;

public class browseInterceotor implements HandlerInterceptor{

	
	@Autowired
	private PetitionService service;
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		ServletContext application = request.getServletContext();
		
		if(application.getAttribute("browsePtList") == null) {
//			System.out.println("호출!!");

			List<BrowsePetition> browsePtList = service.selectBrowsePtList();
			application.setAttribute("browsePtList", browsePtList);
			
//			System.out.println(browsePtList);
		}
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

	
	
}
