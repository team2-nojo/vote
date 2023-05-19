package edu.nojo.vote.myPetitions.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dto.Like;
import edu.nojo.vote.myPetitions.model.service.MyPetitionsDashboardService;
import edu.nojo.vote.user.model.dto.User;

@SessionAttributes({"loginMember"}) 
@RequestMapping("/myPetitions")
@Controller
public class MyPetitionsDashboardController {

	@Autowired 
	private MyPetitionsDashboardService service;
	
	
	// myPetitionsDashboard 대시보드 페이지로 이동
	@GetMapping("/myPetitionsDashboard/{petitionNo}")
	public String myPetitionsDashboard(
							  @SessionAttribute User loginUser
							, Model model
							, @PathVariable("petitionNo") int petitionNo
									) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loginUserNo", loginUser.getUserNo());
		map.put("petitionNo", petitionNo);
		
		// 청원 조회 서비스 호출
		Petition myPetition = service.selectMyPetition(map);

		// 청원 좋아요 누른 회원 리스트 조회 서비스 호출
		List<Like> likeUserList = service.selectlikeUserList(petitionNo);
		
		model.addAttribute("myPetition", myPetition);
		model.addAttribute("likeUserList", likeUserList);
		
		return "/myPetitions/myPetitionsDashboard";

	}
	
	
	// myPetitionEdit 페이지로 이동
	@GetMapping("/myPetitionEdit/{petitionNo}")
	public String myPetitionEdit(
							@SessionAttribute User loginUser
							, Model model
							, @PathVariable("petitionNo") int petitionNo
								) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loginUserNo", loginUser.getUserNo());
		map.put("petitionNo", petitionNo);
		
		// 청원 조회 서비스 호출
		Petition myPetition = service.selectMyPetition(map);
		
		model.addAttribute("myPetition", myPetition);
		
		return "/myPetitions/myPetitionEdit";
	}
	
	
	// 내가 작성한 청원글 대시보드 화면 구성 컨트롤
	
	// 작성된 글 상태 확인후 추가가능한 부분 체크리스트
	
	
}
