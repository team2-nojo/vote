package edu.nojo.vote.administrator.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import edu.nojo.vote.administrator.model.service.AdminService;
import edu.nojo.vote.main.model.service.MainPageService;

@Controller
public class AdministratorController {
	
	@Autowired
	private AdminService service;
	
	
	@GetMapping("/adminLogin")
	public String adminLogin() {
		return "admin/adminLogin";
	}
	
//	@GetMapping("/adminPetitionList")
//	public String adminPetitionList() {
//		return "admin/adminPetitionList";
//	}
	//청원 목록 조
	@GetMapping("/adminPetitionList")
	public String selectPetitionList(
//		  @PathVariable("petitionNo") int petitionNo
		  @RequestParam(value="cp", required=false, defaultValue="1") int cp
		  ,Model model) {
		Map<String, Object> map = service.selectPetitionList(cp);
		
		// 조회 결과를 request scope에 세팅 후 forward
		model.addAttribute("map", map);
		
		
		return "admin/adminPetitionList";
	}
	
}
