package edu.nojo.vote.writePetition.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.user.model.dto.User;
import edu.nojo.vote.writePetition.model.service.WritePetitionService;

@Controller
@RequestMapping("/writePetition")
@SessionAttributes({"loginUser"}) 
public class WritePetitionController {
	
	@Autowired
	WritePetitionService service;
	
	@GetMapping
	public String writePetition() {
		return "writePetition/writePetition";
	}
	
	@PostMapping
	public String writePetition(@SessionAttribute("loginUser") User loginUser
			, @RequestParam(value="categoryItems", required=false)List<Integer> categoryItems
			, @RequestParam(value="directInput", defaultValue="n")String directInput
			, @RequestParam(value="directInputCategory", required=false)List<String> directInputCategory
			, @RequestParam(value="title")String title
			, @RequestParam(value="editorContent")String content
			, @RequestParam(value="thumbnailImage", required=false) MultipartFile thumbnailImage
			, HttpSession session) throws IllegalStateException, IOException, Exception {
		Petition petition = new Petition();
		
		petition.setUserNo(loginUser.getUserNo());
		petition.setPetitionTitle(title);
		petition.setPetitionContent(content);
		String webPath = "/resources/images/writePetition/";
		String filePath = session.getServletContext().getRealPath(webPath);
		service.writePetition(petition,categoryItems,directInput,directInputCategory,thumbnailImage,webPath,filePath);
		
		
		
		return "redirect:/";
	}
}