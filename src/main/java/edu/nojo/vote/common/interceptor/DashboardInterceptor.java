package edu.nojo.vote.common.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.service.MyPetitionsDashboardService;
import edu.nojo.vote.user.model.dto.User;

public class DashboardInterceptor implements HandlerInterceptor{
	
	@Autowired 
	private MyPetitionsDashboardService service;
	 

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		String url = request.getRequestURI();
		
		String[] arr = url.split("/"); 
		
		String num = arr[arr.length-1];
		
		int boardNo = 0;
		
		try {
			boardNo = Integer.parseInt(num);
			
		} catch (Exception e) {
			return HandlerInterceptor.super.preHandle(request, response, handler);
		}
		
		HttpSession session = request.getSession();
		
		User user = (User)session.getAttribute("loginUser");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loginUserNo", user.getUserNo());
		map.put("petitionNo", num);
		
		Petition myPetition = service.selectMyPetition(map);
		
		if(myPetition == null) {
			response.sendRedirect(request.getContextPath()+"/myPetitions/myPetitions");
			return false;
		}
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

	
	
}
