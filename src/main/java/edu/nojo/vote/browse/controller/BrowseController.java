package edu.nojo.vote.browse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/browse")
public class BrowseController {
	
	// browse 페이지 이동
	@GetMapping("/browse_search")
	public String browse_search() {
		return "/browse/browse_search";
	}
	
	
	// view 페이지 이동
	@GetMapping("/petitionView")
	public String petitionView() {
		return "/browse/petitionView";
	}

	
	// 정책위반신고 페이지 이동
	@GetMapping("/report_popUp")
	public String report_popUp() {
		return "/browse/report_popUp";
	}

	
	

	
	
	
}