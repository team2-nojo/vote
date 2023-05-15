package edu.nojo.vote.myPetitions.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.nojo.vote.myPetitions.model.service.MyPetitionsService;
import edu.nojo.vote.user.model.dto.User;

@SessionAttributes({"loginMember"}) 
@RequestMapping("/myPetitions")
@Controller
public class MyPetitionsController {

	@Autowired 
	private MyPetitionsService service;
	
	// myPetitions 메인에서 내 청원 페이지로 이동
	@GetMapping("/myPetitions")
	public String myPetitions() {
		
		
		// 필요한 자원
		// 로그인멤버 : 로그인 한 멤버의 회원 번호, 회원 닉네임, 회원 주소
		// 청원 : 글 번호, 글 제목, 글 내용, 글 삭제여부 (로그인 멤버의 회원 번호로 청원 테이블에서 조회)
		// 청원 좋아요 : 청원 좋아요 개수 (청원에서 글 번호를 받아 청원 좋아요 개수를 조회)
		
		
		
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
	
	// myPetitionEdit 페이지로 이동
	@GetMapping("/myPetitionEdit")
	public String myPetitionEdit() {
		return "/myPetitions/myPetitionEdit";
	}
	
//	// myPetitionComments 페이지로 이동
//	@GetMapping("/myPetitionComments")
//	public String myPetitionComments() {
//		return "/myPetitions/myPetitionsEdit";
//	}
	

	
	
}
