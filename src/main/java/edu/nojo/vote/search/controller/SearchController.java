package edu.nojo.vote.search.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.search.model.service.SearchService;

@Controller
@RequestMapping("/search")
public class SearchController {
	
	@Autowired
	private SearchService service;
	
	
	// 청원 검색 페이지 이동
	@GetMapping("/searchPetition")
	public String searchPetition() {
		return "/search/searchPetition";
	}
	
	// 실시간 검색
    @GetMapping(value="/allSearch", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public List<Map<String, Object>> allSearch(String query){
    	
    	return service.allSearch(query);
    }

	// 검색결과
    @GetMapping("/searchResult")
	public String searchResult(String query, Model model) {
		
		List<Petition> searchList = service.searchResult(query);
		model.addAttribute("searchList", searchList);
		
		return "/search/searchPetition";
	}
}
