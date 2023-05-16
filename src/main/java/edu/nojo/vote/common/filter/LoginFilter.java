package edu.nojo.vote.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebFilter(filterName = "loginFilter", urlPatterns = {"/myPage/*", "/myPetitions/*", "/writePetition"})
public class LoginFilter implements Filter {


	public void destroy() {
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 필터링 코드를 작성하는 메서드
		// 1) ServletRequest, ServletResponse를 다운캐스팅
		HttpServletRequest req = (HttpServletRequest)request; 
		HttpServletResponse resp = (HttpServletResponse)response; 
		
		// 2) 다운캐스팅한 HttpServletRequest를 이용해서 HttpSession 얻어오기
		HttpSession session = req.getSession();
		
		// 3) session에서 “loginMember” key를 가진 속성을 얻어와, null인 경우 메인 페이지로 redirect
		
//		관리자가 아니면 메인페이지로 보내는 필터 예시
//		Member loginMember = (Member)session.getAttribute("loginMember");
//		if(loginMember.getAuthority() != 2) {
//			
//		} else {
//			
//		}
		
		
		if(session.getAttribute("loginUser") == null) {
			resp.sendRedirect("/user/login");
		// 4) 로그인 상태인 경우 다음 필터 또는 Dispatcher Servlet으로 전달
		} else {
			chain.doFilter(request, response);
		}
	}


	public void init(FilterConfig fConfig) throws ServletException {
	}

}
