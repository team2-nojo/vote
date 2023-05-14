package edu.nojo.vote.search;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	
	// 청원 검색 페이지 이동
	@GetMapping("/searchPetition")
	public String searchPetition() {
		return "/search/searchPetition";
	}
	
	

	
	

}
