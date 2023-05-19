package edu.nojo.vote.mypage.controller;

import java.io.IOException;

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
         @RequestParam("userImage") MultipartFile userImage // 업로드 파일
         , @SessionAttribute("loginUser") User loginUser // 로그인 회원
         , User updateUser
         , String[] userAddress
         , RedirectAttributes ra // 리다이렉트 시 메세지 전달
//         , HttpSession session // 세션 객체
         )   throws IllegalStateException, IOException {
	   System.out.println("프로필이미지로오나");
	   	 int result = 0;
	   	 String message = null;
      
//         // 프로필 이미지 수정
//         String Path = "/resources/images/user/" + userImage.getOriginalFilename();
//         // 프로필 이미지 수정 서비스 호출
//         result = service.updateProfileImage(userImage, Path, loginUser);
//         // 프로필 update문 실패시
//         if(result <= 0) 
//            {
//        	 System.out.println("이미지변이실패했나");
//            message = "프로필 이미지 변경 실패";
//            ra.addFlashAttribute("message", message);
//            return "redirect:/myPage/editProfile";
//         }
         
         
//      // 주소 하나로 합치지 (a^^^b^^^c)
// 		String addr = String.join("^^^", userAddress);
// 		System.out.println("주소로오나");
// 		
// 		// 로그인한 회원의 번호를 updateMember에 추가
// 		updateUser.setUserNo( updateUser.getUserNo() );
// 		
// 		// DB 회원 정보 수정(UPDATE) 서비스 호출
// 		result = service.updateProfile(updateUser);
// 		
// 		if(result > 0) { // 성공
// 			message = "회원 정보가 수정되었습니다.";
// 			// Session에 로그인된 회원 정보도 수정(동기화)
// 			loginUser.setUserNickname(updateUser.getUserNickname());
// 			loginUser.setUserAboutMe(updateUser.getUserAboutMe());
// 			loginUser.setUserAddress(updateUser.getUserAddress());
// 		}else { // 실패
// 			message = "회원 정보 수정 실패";
// 			return "redirect:/myPage/editProfile";
// 			// 올라간 이미지 삭제
// 		}
// 		ra.addFlashAttribute("message", message);
// 	         
//         
         return "redirect:/myPetitions";
   }

}