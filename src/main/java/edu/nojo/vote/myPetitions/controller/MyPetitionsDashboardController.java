package edu.nojo.vote.myPetitions.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.nojo.vote.myPetitions.model.service.MyPetitionsService;

@SessionAttributes({"loginMember"}) 
@RequestMapping("/myPetitionsDashboard")
@Controller
public class MyPetitionsDashboardController {

	@Autowired 
	private MyPetitionsService service;
	
	
	// 내가 작성한 청원글 대시보드 화면 구성 컨트롤
	
	// 전체 후원자 목록 조회
	
	// 최근 후원자 목록 조회해서 표시
	
	// 작성된 글 상태 확인후 추가가능한 부분 체크리스트
	
	
	
	
	
	
}
