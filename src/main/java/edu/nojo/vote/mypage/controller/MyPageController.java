package edu.nojo.vote.myPage.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.compiler.ast.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.nojo.vote.myPage.model.service.MyPageService;
import edu.nojo.vote.user.model.dto.User;

@SessionAttributes({"loginUser"}) 
@RequestMapping("/myPage")
@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	
	
	// editProfil로 이동
	@GetMapping("/editProfile")
	public String myPetitionDetails() {
		return "/myPage/editProfile";
	}
	
	
	
	// 닉네임 중복 검사
	@GetMapping("/dupCheck/nickname")
	@ResponseBody
	public int checkNickname(@RequestParam String nickname) {
		
		//System.out.println(service.checkNickname(nickname));
		return service.checkNickname(nickname);
	}
	
	
	
	// 프로필 이미지 수정
	@PostMapping("/editProfile")
	public String updateProfile(
			@RequestParam("userImage") MultipartFile userImage // 업로드 파일
			, @SessionAttribute("loginUser") User loginUser // 로그인 회원
			, RedirectAttributes ra // 리다이렉트 시 메세지 전달
//			, HttpSession session // 세션 객체
			)   throws IllegalStateException, IOException{
		
		
			// 웹 접근 경로
			String Path = "/resources/images/user/" + userImage.getOriginalFilename();
			
			// 프로필 이미지 수정 서비스 호출
			int result = service.updateProfile(userImage, Path, loginUser);
			
			String message = null;
			if(result > 0)	message = "프로필 이미지가 변경";
			else			message = "프로필 이미지 변경 실패";
			
			ra.addFlashAttribute("message", message);
			
			return "redirect:editProfile";
	}
	
	
	
	
	
	
	
	

}
