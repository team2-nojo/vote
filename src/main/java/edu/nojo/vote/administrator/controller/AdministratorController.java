package edu.nojo.vote.administrator.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdministratorController {
	
	@GetMapping("/adminLogin")
	public String adminLogin() {
		return "admin/adminLogin";
	}
	
	@GetMapping("/adminDashBoard")
	public String adminDashBoard() {
		return "admin/adminDashBoard";
	}
}
