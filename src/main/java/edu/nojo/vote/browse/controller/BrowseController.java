package edu.nojo.vote.browse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/browse")
public class BrowseController {
	
	// browse 페이지 이동(featured)
	@GetMapping("browse_search/featured")
	public String featured() {
		return "/browse/browse_search/featured";
	}
	
	// browse 페이지 이동(popular)
	@GetMapping("/browse_search/popular")
	public String popular() {
		return "/browse/browse_search/popular";
	}
	
	// browse 페이지 이동(recent)
	@GetMapping("/browse_search/recent")
	public String recent() {
		return "/browse/browse_search/recent";
	}
	
	// browse 페이지 이동
	@GetMapping("/browse_search/victories")
	public String victories() {
		return "/browse/browse_search/victories";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// view 페이지 이동
	@GetMapping("/petitionView/details")
	public String details() {
		return "/browse/petitionView/details";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	// 정책위반신고 페이지 이동
	@GetMapping("/report_popUp")
	public String report_popUp() {
		return "/browse/report_popUp";
	}

	
	

	
	
	
}