package edu.nojo.vote.main.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.main.model.service.MainPageService;


@Controller
public class MainController {
	
	
	@Autowired
	private MainPageService service;
	
	
	@GetMapping("/")
	public String mainForward(Model model) {
		List<Petition> mainPetitionList = service.selectPetition(0);
		model.addAttribute("mainPetitionList", mainPetitionList);
		
		return "common/main";
	}
	
	@GetMapping("/load-petitions")
	@ResponseBody
	public List<Petition> loadPetitions(@RequestParam int page) {
		List<Petition> mainPetitionList = service.selectPetition(page);
		return mainPetitionList;
	}

	
	
}