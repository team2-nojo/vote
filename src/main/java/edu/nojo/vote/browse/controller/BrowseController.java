package edu.nojo.vote.browse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.nojo.vote.browse.model.service.BrowseService;
import edu.nojo.vote.main.model.dto.Petition;


@Controller
@RequestMapping("/browse")
public class BrowseController {

	@Autowired
	private BrowseService service;
	
	
	// browse 페이지 이동(popular)
	@GetMapping("/browse_search/popular")
	public String popular(Model model) {
		
		// popular로 조회
		List<Petition> popularList = service.popular();
		model.addAttribute("popularList", popularList);
		
		return "/browse/browse_search/popular";
	}
	
	// browse 페이지 이동(recent)
	@GetMapping("/browse_search/recent")
	public String recent(Model model) {
		
		// recent로 조회
		List<Petition> recentList = service.recent();
		model.addAttribute("recentList", recentList);
		
		return "/browse/browse_search/recent";
	}
	
	
	// browse 페이지 이동(victories)
	@GetMapping("/browse_search/victories")
	public String victories(Model model) {
		
		// victories 최신순으로 조회
		List<Petition> victoriesList = service.victories();
		model.addAttribute("victoriesList", victoriesList);
		
		return "/browse/browse_search/victories";
	}
	
	// browsePetition 조회
//	@GetMapping("")
//	public String browsePetition() {
//		return null;
//	}
	
	
	
	
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