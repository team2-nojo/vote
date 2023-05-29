package edu.nojo.vote.myPetitions.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dto.PetitionUpdate;
import edu.nojo.vote.myPetitions.model.service.EmailService;
import edu.nojo.vote.myPetitions.model.service.MyPetitionsDashboardService;
import edu.nojo.vote.myPetitions.model.service.MyPetitionsService;
import edu.nojo.vote.user.model.dto.User;

@SessionAttributes({ "loginUser" })
@RequestMapping("/myPetitions")
@Controller
public class MyPetitionsController {

	@Autowired
	private MyPetitionsService service;

	@Autowired
	private MyPetitionsDashboardService dashboardService;
	
	@Autowired
	private EmailService emailService;

	
	
	// myPetitions 메인에서 내 청원 페이지로 이동
	@GetMapping("/myPetitions")
	public String myPetitions(@SessionAttribute User loginUser, Model model) {

		// 로그인 한 유저의 회원 번호를 이용해 작성한 글 목록 조회
		List<Petition> petitionList = service.selectMyPetitions(loginUser.getUserNo());

		// 로그인 한 유저의 좋아요 한 글 목록 조회 
		List<Petition> likeList = service.selectLikePetition(loginUser.getUserNo());
			
		// 조회한 내가 작성한 글 목록을 화면으로 전달
		model.addAttribute("petitionList", petitionList);
		
		// 조회한 좋아요 한 글 목록을 화면으로 전달
		model.addAttribute("likeList", likeList);		

		
		return "/myPetitions/myPetitions";
	}

	
	// myPetitionDashboardUpdate로 이동
	@GetMapping("/myPetitionsDashboard/myPetitionDashboardUpdate/{petitionNo}")
	public String myPetitionsDashboard(@SessionAttribute User loginUser, Model model,
			@PathVariable("petitionNo") int petitionNo) {


		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loginUserNo", loginUser.getUserNo());
		map.put("petitionNo", petitionNo);

		// 청원 조회 서비스 호출
		Petition myPetition = dashboardService.selectMyPetition(map);
		model.addAttribute("myPetition", myPetition);
		
		

		return "/myPetitions/myPetitionDashboardUpdate";
	}
	
	
	// 청원 업데이트 게시글 작성
	@PostMapping("/myPetitionsDashboard/myPetitionDashboardUpdate/insert/{petitionNo}")
	public String updateInsert(
			@SessionAttribute User loginUser
		   ,@PathVariable ("petitionNo") int petitionNo
		   ,@RequestParam(value="petitionUpdateTitle", required=false) String petitionUpdateTitle
		   ,@RequestParam(value="inputImage", required=false) MultipartFile inputImage
		   , @RequestParam(value="petitionUpdateContent", required=false)String petitionUpdateContent
		   ,HttpSession session
		   ,RedirectAttributes ra
		   ) throws IllegalStateException, IOException {
		
		String message = null;
		PetitionUpdate update = new PetitionUpdate();
		
		// 청원 업데이트 DB 삽입
		// update 객체에 받아온 값 입력
		update.setPetitionNo(petitionNo);
		update.setPetitionUpdateTitle(petitionUpdateTitle);
		update.setPetitionUpdateContent(petitionUpdateContent);
		update.setUserNo(loginUser.getUserNo());
		
		// 이미지 파일 생성을 위한 경로값
		String webPath = "/resources/images/petitionUpdate/";
		String filePath = session.getServletContext().getRealPath(webPath);
		
		// 이미지 업데이트 삽입을 위한 서비스 호출
		int result = service.updateInsert(update, inputImage, webPath, filePath);
		
        if(result <= 0) 
        {
	        message = "업데이트 업로드 실패";
	        ra.addFlashAttribute("message", message);
	        // 업데이트 작성 화면으로 다시 리다이렉트
	        return "/myPetitionsDashboard/myPetitionDashboardUpdate/{petitionNo}/insert";
        }
		
        // 청원 업데이트 내용을 이메일로 청원 지지자에게 전송
        // 해당 청원 지지자 호출
//        List<Like> likeUserList = dashboardService.selectlikeUserList(petitionNo);
//        if (likeUserList.isEmpty()) {
//        	return "redirect:/myPetitions/myPetitionsDashboard/{petitionNo}";
//        } 
//        result = emailService.sendEmail(update, likeUserList);
       
        // 내 페티션 화면으로 리다이렉트
		return "redirect:/browse/petitionView/details/{petitionNo}";
	}
	
}