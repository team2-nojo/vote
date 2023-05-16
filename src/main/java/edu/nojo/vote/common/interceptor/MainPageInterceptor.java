package edu.nojo.vote.common.interceptor;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import edu.nojo.vote.main.model.service.MainPageService;

public class MainPageInterceptor implements HandlerInterceptor{
	
	@Autowired
	private MainPageService service; // bean으로 등록된 MainPageService를 의존성 주입
	 
	
	
	
	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//application scope 내장 객체 얻어오기
		ServletContext application = request.getServletContext();
		
		// 서버시작 후 누구도 요청이 한적이 없을 경우
		if(application.getAttribute("mainPtList") == null) {
			
			// 조회 서비스 호출
			System.out.println("메인페이지 조회 서비스 호출");
			
			List<Map<String, Object>> mainPtList = service.selectMainPtList();
			List<Map<String, Object>> mainUserList = service.selectMainUserList();
			
			
			System.out.println(mainPtList);
			System.out.println(mainUserList);
			
			
			// application scope에 세팅
			application.setAttribute("mainPtList", mainPtList);
			application.setAttribute("mainUserList", mainUserList);
			
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
