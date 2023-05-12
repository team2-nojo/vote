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
	
	// myPetitions 메인에서 내 청원 페이지로 이동
	@GetMapping("/myPetitions")
	public String myPetitions() {
		return "/myPetitions/myPetitions";
	}
	
	// myPetitionsDashboard 대시보드 페이지로 이동
	@GetMapping("/myPetitionsDashboard")
	public String myPetitionsDashboard() {
		return "/myPetitions/myPetitionsDashboard";
	}
	
//	// myPetitionDetails 상세페이지로 이동
//	@GetMapping("/myPetitionDetails")
//	public String myPetitionDetails() {
//		return "/myPetitions/myPetitionsDetails";
//	}
	
//	// myPetitionEdit 페이지로 이동
//	@GetMapping("/myPetitionEdit")
//	public String myPetitionEdit() {
//		return "/myPetitions/myPetitionsEdit";
//	}
	
//	// myPetitionComments 페이지로 이동
//	@GetMapping("/myPetitionComments")
//	public String myPetitionComments() {
//		return "/myPetitions/myPetitionsEdit";
//	}
	

	
	
}
