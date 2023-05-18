package edu.nojo.vote.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.nojo.vote.mypage.model.service.MyPageService;

@SessionAttributes({"loginUser"}) 
@RequestMapping("/myPage")
@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService service;
	
	// myPetitionDetails 상세페이지로 이동
	@GetMapping("/editProfile")
	public String myPetitionDetails() {
		return "/myPage/editProfile";
	}

}
