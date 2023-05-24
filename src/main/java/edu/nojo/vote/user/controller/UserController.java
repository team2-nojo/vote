package edu.nojo.vote.user.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.nojo.vote.mypage.model.service.MyPageService;
import edu.nojo.vote.user.model.dto.User;
import edu.nojo.vote.user.model.service.UserService;

@Controller
@RequestMapping("/user")
@SessionAttributes({"loginUser"}) 
public class UserController {

	@Autowired
	private UserService service;
	
	@Autowired
	private MyPageService myPageService;
	
	// 로그인 페이지로 이동
	@GetMapping("/login")
	public String login() {
		return "/user/login";
	}
	
	
	
	// 로그인 페이지에서 로그인 요청
	@PostMapping("/login")
	public String login(User inputUser
						// 파라미터를 필드에 담은 커맨드 객체
						, Model model
						, @RequestHeader(value="referer") String referer
						// -> 요청 HTTP header에서 "referer"(이전주소) 값을 얻어와 매개 변수 String referer에 저장
						, @RequestParam(value="saveId", required=false) String saveId
						// -> name속성 값이 "saveId"인 파라미터를 전달 받아 저장
						// -> required=false : 필수 아님(null 허용)
						, HttpServletResponse resp
						// HttpServletResponse resp : 서버 -> 클라이언트 응답 방법을 가지고 있는 객체
						, RedirectAttributes ra
						// 메시지를 리다이렉트에 담아서 보내버림
						) {
		
		
		// 로그인 서비스 호출
		User loginUser = service.login(inputUser);
		
		
		String path = "redirect:";
		
		if(loginUser != null) { // 로그인 성공시

			// 메인페이지로 이동
			path += "/";
			// model 전달객체에 세팅 -> 클래스 위에 @SessionAttributes으로 세션으로 추가됨
			model.addAttribute("loginUser",loginUser);
			
			//--------- 쿠키생성(은 일단 했으나 로그인페이지에 아이디저장 체크박스가 없음..) --------- 
			Cookie cookie = new Cookie("saveId", loginUser.getUserEmail());
			
			if(saveId != null) { // 체크 되었을 때
				// 한 달(30일) 동안 유지되는 쿠키 생성
				cookie.setMaxAge(60 * 60 * 24 * 30); // 초 단위로 지정
				
			}else { // 체크 안 되었을 때
				// 0초 동안 유지되는 쿠키 생성
				// -> 기존 쿠키를 삭제
				cookie.setMaxAge(0);
			}
			
			cookie.setPath("/");
			resp.addCookie(cookie);
			//  ------------------------------------ 쿠키 끝 ------------------------------------ 
			
		}else {
			
			// 이전페이지로 돌아감
			path += referer;
			ra.addFlashAttribute("serverMessage","아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		
		return path;
	}
	
	
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(SessionStatus status, HttpSession session) {
		
		status.setComplete();
		
		return "redirect:/";
	}
	
	
	// 회원가입 페이지로 이동
	@GetMapping("/signUp")
	public String signUp() {
		return "/user/signUp";
	}
	
	
	// 회원가입 
	@PostMapping("/signUp")
	public String signUp(User inputUser
						, String[] userAddress
						, String agreeEmail
						, RedirectAttributes ra
						) {
		// 만약 주소를 입력하지 않은 경우(,,) null로 변경
		if(inputUser.getUserAddress().equals(",")) {
			inputUser.setUserAddress(null);
		} else {
			//String.join("구분자", String[])
			// 배열의 요소를 하나의 문자열로 변경
			// 단, 요소 사이에 "구분자" 추가
			String addr = String.join("^^^", userAddress);
			inputUser.setUserAddress(addr);
		}

		// 회원가입 서비스 호출
		int result = service.signUp(inputUser,agreeEmail);

		// 가입 성공 여부에 따라 주소 결정
		String path = "redirect:";
		String message = null;
		
		if(result > 0) { // 가입 성공
			path += "/"; // 메인 페이지
			message = inputUser.getUserNickname() + "님의 가입을 환영합니다.";
		} else { // 가입 실패
			// 회원 가입 페이지로 이동
			path += "signUp";  // 상대 경로
			message = "회원 가입 실패!";
		}
		
		// 리다이렉트 시 session에 잠깐 올라갔다 내려오도록 세팅
		ra.addFlashAttribute("serverMessage", message);
		
		return path;
	}
	
	
	// 이메일 중복 검사
	@GetMapping("dupCheck/checkEmail")
	@ResponseBody
	public int checkEmail(String email) {
		return service.checkEmail(email);
	}
	
	
	// 닉네임 중복 검사
	@GetMapping("dupCheck/nickname")
	@ResponseBody
	public int checkNickname(String nickname) {
		return service.checkNickname(nickname);
	}
	
	
	
	// 비밀번호 찾기 페이지로 이동
	@GetMapping("/searchPw")
	public String searchPw() {
		return "/user/searchPw";
	}
	
	
	
	// 가입동의 페이지로 이동
	@GetMapping("/agreeService")
	public String agreeService() {
		return "/user/agreeService";
	}
}
