package edu.nojo.vote.myPetitions.controller;

import java.util.HashMap;
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
import edu.nojo.vote.myPetitions.model.service.MyPetitionsDashboardService;
import edu.nojo.vote.user.model.dto.User;

@SessionAttributes({"loginMember"}) 
@RequestMapping("/myPetitions")
@Controller
public class MyPetitionsEditController {

	@Autowired
	private MyPetitionsDashboardService service;
	
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
	
	
}
