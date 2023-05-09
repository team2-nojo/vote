package edu.nojo.vote.writePetition.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WritePetitionController {
	@GetMapping("/writePetition")
	public String writePetition() {
		return "writePetition/writePetition";
	}
}