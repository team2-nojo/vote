package edu.nojo.vote.main.controller;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.text.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.main.model.service.MainPageService;
import edu.nojo.vote.myPetitions.model.dto.Like;
import edu.nojo.vote.user.model.dto.User;


@Controller
public class MainController {
	
	
	@Autowired
	private MainPageService service;
	
	
	@GetMapping("/")
	public String mainForward(
			Model model
			) {
		
				
		List<Petition> mainPetitionList = service.selectPetition();
		
		
		model.addAttribute("mainPetitionList", mainPetitionList);
		
		return "common/main";
	}
	
	@GetMapping("/load-petitions")
	@ResponseBody
	public List<Petition> loadPetitions() {
		List<Petition> mainPetitionList = service.selectPetition();
		return mainPetitionList;
	}

	
	
}