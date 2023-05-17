package edu.nojo.vote.help.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import edu.nojo.vote.help.model.service.HelpService;

@RequestMapping("/clientCenter")
@Controller
public class HelpController {
	
	@Autowired
	private HelpService service;
	
	@GetMapping("/FAQ")
	public String FAQ() {
		
		return "/clientCenter/FAQ";
	}
	
    @GetMapping("/popup")
    public String popup() {
    	
    	return "/clientCenter/popup";
    }
    
    @PostMapping("/Q&A")
    public String QA() {
    		
    	return "/clientCenter/Q&A";
    }    
    
    @GetMapping("/Q&A3")
    public String QA3(
    	@RequestParam(value="cp", required=false, defaultValue="1") int cp
    	, Model model) {
    	Map<String, Object> map = service.QA3(cp);
    	
    	model.addAttribute("map", map);
    	
  
    	return "/clientCenter/Q&A3";
    }   
}
