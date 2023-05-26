package edu.nojo.vote.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.nojo.vote.mypage.model.service.MyPageService;
import edu.nojo.vote.user.model.dto.User;


@SessionAttributes({"loginUser"}) 
@RequestMapping("/myPage")
@Controller
public class MyPageController {
   @Autowired
   private MyPageService service;
  
  
    @GetMapping
    public String myPage() {
        return "myPage/myPage";
    }
   
   
   
   // editProfil로 이동
   @GetMapping("/editProfile")
   public String myPetitionDetails() {
      return "/myPage/editProfile";
   }
   
   // profile로 이동
   @GetMapping("/profile/{userNo}")
   public String Profile(Model model
		   				,@PathVariable("userNo") int userNo) {
	   
	   
	   // 해당 유저 조회 서비스 호출
	   User selectedUser = service.selectUser(userNo);
	   
	   // Model로 해당 유저의 userNo, userImage, userNickname, userAddress, userAboutMe 보내기
	   model.addAttribute("selectedUser", selectedUser);
	   
	   
	   return "/myPage/profile";
   }
   
   
   
   // 닉네임 중복 검사
   @GetMapping("/dupCheck/nickname")
   @ResponseBody
   public int checkNickname(@RequestParam String nickname) {
      
      //System.out.println(service.checkNickname(nickname));
      return service.checkNickname(nickname);
   }
   
   
   
  
   // 회원정보 수정(파일 미스매치 에러 해결중)
   @PostMapping("/editProfile")
   public String updateProfile(
         @RequestParam(value="profileImage", required=false) MultipartFile profileImage // 업로드 파일
         , @SessionAttribute("loginUser") User loginUser // 로그인 회원
         , User updateUser
         , String[] userAddress
         , RedirectAttributes ra // 리다이렉트 시 메세지 전달
         , HttpSession session // 세션 객체
         )   throws IllegalStateException, IOException {
	   	 int result = 0;
	   	 String message = null;
	   	 
	
         // 프로필 이미지 수정
         String webpath = "/resources/images/user/";
 		 String filePath = session.getServletContext().getRealPath(webpath);
         result = service.updateProfileImage(profileImage, webpath, filePath, loginUser);

         if(result <= 0) 
            {
            message = "프로필 이미지 변경 실패";
            ra.addFlashAttribute("message", message);
            return "redirect:/myPage/editProfile";
         }
         
        
      
         
         
      // 주소 하나로 합치기 (a^^^b^^^c)
 		String addr = String.join("^^^", userAddress);
 		updateUser.setUserAddress(addr);
 		
 		// 로그인한 회원의 번호를 updateMember에 추가
 		updateUser.setUserNo( loginUser.getUserNo() );
 		
 		// DB 회원 정보 수정(UPDATE) 서비스 호출
 		result = service.updateProfile(updateUser);
 		
 		if(result > 0) { // 성공
 			message = "회원 정보가 수정되었습니다.";
 			// Session에 로그인된 회원 정보도 수정(동기화)
 			loginUser.setUserNickname(updateUser.getUserNickname());
 			loginUser.setUserAboutMe(updateUser.getUserAboutMe());
 			loginUser.setUserAddress(updateUser.getUserAddress());
 		}else { // 실패
 			message = "회원 정보 수정 실패";
 			return "redirect:/myPage/editProfile";
 			// 올라간 이미지 삭제
 		}
 		ra.addFlashAttribute("message", message);
 	         
         
         return "redirect:/myPetitions/myPetitions";
   }
   
   
   @GetMapping("/changePassword")
   public String changePassword() {
	   return "myPage/changePassword";
   }
   
   @PostMapping("/changePassword")
   public String changePassword(@SessionAttribute("loginUser") User loginUser
		   , String currentPassword
		   , String newPassword
		   , RedirectAttributes ra) {
	   int result = service.changePassword(loginUser, currentPassword, newPassword);
	   String path = "redirect:";
	   String message = null;
	   if(result > 0) {
		   path += "/myPage";
		   message = "비밀번호가 변경되었습니다.";
	   } else {
		   path += "changePassword";
		   message = "현재 비밀번호가 일치하지 않습니다.";
	   }
	   ra.addFlashAttribute("serverMessage",message);
	   return path;
   }
   
   
   @GetMapping("/emailSettings")
   public String emailSettings() {
	   return "myPage/emailSettings";
   }
   
   @PostMapping("/emailSettings")
   public String emailSettings(@SessionAttribute("loginUser") User loginUser
		   , @RequestParam(value = "items", required=false) List<Integer> items
		   , RedirectAttributes ra
		   ) {
	   loginUser.setEmailSettings(items);
	   int result = service.emailSettings(loginUser);
	   ra.addFlashAttribute("serverMessage","이메일 수신 설정이 변경되었습니다.");
	   
	   return "redirect:/myPage";
   }
   
   @GetMapping("/secession")
   public String secession() {
	   return "myPage/secession";
   }
   
   @PostMapping("/secession")
   public String secession(@SessionAttribute("loginUser") User loginUser
		   , @RequestParam("userPw")String userPw
		   , SessionStatus status
		   , RedirectAttributes ra) {
	   int result = service.secession(loginUser, userPw);
	   
	   String message = null;
	   String path = "redirect:";
	   
	   if(result>0) {
		   message = "계정이 비활성화되었습니다.";
		   path += "/";
		   status.setComplete();
	   } else {
		   message = "비밀번호가 일치하지 않습니다.";
		   path += "secession";
	   }
	   
	   ra.addFlashAttribute("serverMessage",message);
	   return path;
   }
}