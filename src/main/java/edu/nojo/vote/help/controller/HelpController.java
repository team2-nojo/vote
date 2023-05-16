package edu.nojo.vote.help.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/clientCenter")
@Controller
public class HelpController {
	
	@GetMapping("/FAQ")
	public String FAQ() {
		
		return "/clientCenter/FAQ";
	}

}
