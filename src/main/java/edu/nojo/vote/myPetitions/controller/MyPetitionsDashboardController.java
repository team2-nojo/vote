package edu.nojo.vote.myPetitions.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.service.MyPetitionsService;
import edu.nojo.vote.user.model.dto.User;

@SessionAttributes({"loginMember"}) 
@RequestMapping("/myPetitions")
@Controller
public class MyPetitionsDashboardController {

	@Autowired 
	private MyPetitionsService service;
	
	
	// myPetitionsDashboard 대시보드 페이지로 이동
	@GetMapping("/myPetitionsDashboard")
	public String myPetitionsDashboard(
//			@SessionAttribute User loginUser
//									, Model model
//									, RedirectAttributes ra
									) {
		
//		List<Petition> petitionList = service.selectMyPetitions(loginUser.getUserNo());
		
//		model.addAttribute("petitionList",petitionList);
		
		return "/myPetitions/myPetitionsDashboard";
	}
	
	
	
	// 내가 작성한 청원글 대시보드 화면 구성 컨트롤
	
	// 전체 후원자 목록 조회
	
	// 최근 후원자 목록 조회해서 표시
	
	// 작성된 글 상태 확인후 추가가능한 부분 체크리스트
	
	
	
	
	
	
}
