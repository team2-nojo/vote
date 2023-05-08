package edu.nojo.vote.myPetitions.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.nojo.vote.myPetitions.model.service.MyPetitionsService;

@SessionAttributes({"loginMember"}) 
@RequestMapping("/myPetitions")
@Controller
public class MyPetitionsController {

	@Autowired 
	private MyPetitionsService service;
	
	// myPetitions 페이지로 이동
	@GetMapping("/myPetitions")
	public String myPetitions() {
		return "/myPetitions/myPetitions";
	}
	
	// myPetitions 페이지로 이동
	@GetMapping("/myPetitionsDashboard")
	public String myPetitionsDashboard() {
		return "/myPetitions/myPetitionsDashboard";
	}
	
	
}
