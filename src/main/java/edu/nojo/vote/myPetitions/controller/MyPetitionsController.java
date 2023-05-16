package edu.nojo.vote.myPetitions.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.nojo.vote.main.model.dto.Petition;
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
	public String myPetitions(@SessionAttribute User loginUser
							 ,Model model) {
		
		// 필요한 자원
		// 로그인멤버 : 로그인 한 멤버의 회원 번호, 회원 닉네임, 회원 주소
		// 청원 : 글 번호, 글 제목, 글 내용, 글 삭제여부 (로그인 멤버의 회원 번호로 청원 테이블에서 조회)
		// 청원 좋아요 : 청원 좋아요 개수 (로그인 멤버의 회원 번호를 받아 청원 좋아요한 글을 조회)
		// 청원 좋아요 글 : 글 번호, 글 제목, 글 내용, 글 삭제여부(청원 좋아요한 글의 번호를 받아 청원 좋아요한 글을 조회)
		
		// 로그인 한 멤버의 회원 번호를 이용해 작성한 글 목록 조회
		List<Petition> petitionList = service.selectMyPetitions(loginUser.getUserNo());
		
		//테스트
		System.out.println(petitionList.get(0).getPetitionTitle());
		System.out.println(petitionList.size());
		
		// 
		
		
		
		
		
		return "/myPetitions/myPetitions";
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
