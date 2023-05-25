package edu.nojo.vote.myPetitions.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.service.MyPetitionsDashboardService;
import edu.nojo.vote.user.model.dto.User;
import edu.nojo.vote.writePetition.model.dto.PetitionCategory;

@SessionAttributes({"loginMember"}) 
@RequestMapping("/myPetitions")
@Controller
public class MyPetitionsEditController {

	@Autowired
	private MyPetitionsDashboardService service;
	
	// myPetitionEdit 페이지로 이동
	@GetMapping("/myPetitionEdit/{petitionNo}")
	public String myPetitionEdit(
							@SessionAttribute User loginUser
							, Model model
							, @PathVariable("petitionNo") int petitionNo
								) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loginUserNo", loginUser.getUserNo());
		map.put("petitionNo", petitionNo);
		
		// 청원 조회 서비스 호출
		Petition myPetition = service.selectMyPetition(map);
		
		// 카테고리 조회 서비스 호출
		List<PetitionCategory> category = service.selectCatagory(petitionNo);
		
		
		model.addAttribute("myPetition", myPetition);
		model.addAttribute("category", category);
		
		
		return "/myPetitions/myPetitionEdit";
	}
	
	
	// myPetitionEdit 수정
	@PostMapping("/myPetitionEdit/{petitionNo}")
	public String myPetitionUpdate(@SessionAttribute User loginUser
			, Model model
			, @PathVariable("petitionNo") int petitionNo
			, @RequestParam(value="conTitle")String title
			, @RequestParam(value="editorContent")String content
			, @RequestParam(value="inputCategory")String category
			, @RequestParam(value="thumbnailImage", required=false) MultipartFile thumbnailImage
			, RedirectAttributes ra
			, HttpSession session
			) throws IllegalStateException, IOException {
		
	
		
		Petition petition = new Petition();
		
		petition.setPetitionNo(petitionNo);
		petition.setUserNo(loginUser.getUserNo());
		petition.setPetitionTitle(title);
		petition.setPetitionContent(content);
		
		List<String> categoryList = Arrays.asList(category.split(","));
		
		
		String webPath = "/resources/images/writePetition/";
		String filePath = session.getServletContext().getRealPath(webPath);
		int result = service.myPetitionUpdate(petition,thumbnailImage,webPath,filePath,categoryList);
		
		String serverMessage = null;
		String path = "redirect:/";
		
		
		if(result > 0) {
			serverMessage = "성공적으로 수정되었습니다.";
			path = path + "browse/petitionView/details/" + petitionNo;
		}else {
			serverMessage = "수정실패 하었습니다.";
			path = path + "myPetitions/myPetitionsDashboard/" + petitionNo;
		}
		
		ra.addFlashAttribute("serverMessage", serverMessage);
		
		
		return path;
	}

	
}
