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
	
	// browse 페이지 이동(victories)
	@GetMapping("/browse_search/victories")
	public String victories() {
		return "/browse/browse_search/victories";
	}
	
	
	
	
	
	
	
	// petitionView 페이지 이동(details)
	@GetMapping("/petitionView/details")
	public String details() {
		return "/browse/petitionView/details";
	}
	
	
		
	
	
	
	// petitionView 페이지 이동(comments)
	@GetMapping("/petitionView/comments")
	public String comments() {
		return "/browse/petitionView/comments";
	}

		
		
	// petitionView 페이지 이동(updates)
	@GetMapping("/petitionView/updates")
	public String updates() {
		return "/browse/petitionView/updates";
	}

	
	// petitionView 페이지 이동(updates_detail)
	@GetMapping("/petitionView/updates_detail")
	public String updates_detail() {
		return "/browse/petitionView/updates_detail";
	}	
	
	
	
	
	
	
	
	// 정책위반신고 페이지 이동
	@GetMapping("/petitionView/report_popUp")
	public String report_popUp() {
		return "/browse/petitionView/report_popUp";
	}

	
	

	
	
	
}