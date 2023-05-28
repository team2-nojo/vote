package edu.nojo.vote.administrator.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.nojo.vote.administrator.model.service.AdminService;
import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.user.model.dto.User;

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
	//청원 목록 조회
	@GetMapping("/adminPetitionList")
	public String selectPetitionList(
//		  @PathVariable("petitionNo") int petitionNo
		  @RequestParam(value="cp", required=false, defaultValue="1") int cp
		  ,Model model
		  ,@RequestParam Map<String, Object> paramMap) {
		
		if(paramMap.get("key") == null) { // 검색어가 없을 때 (검색 x)
			Map<String, Object> map = service.selectPetitionList(cp);
			
			// 조회 결과를 request scope에 세팅 후 forward
			model.addAttribute("map", map);
			
		}else { // 검색어가 있을 떄 (검색 햇을 때)
			Map<String, Object> map = service.selectPetitionList(paramMap,cp);
			
			model.addAttribute("map", map);
		}
		
		
		return "admin/adminPetitionList";
	}
	
	
	@PostMapping("/adminPetitionList")
	
	public String updateMainPetition(@RequestParam("selectedNumber") int selectedNumber,
	                                 @RequestParam("petitionNo") int petitionNo
	                                 ,Model model
	                                 ,HttpServletRequest req) {
	    
//		Object[] updateMainPtArr = {selectedNumber, userNickname, petitionNo};
//		for (Object element : updateMainPtArr) {
//		    System.out.println(element);
//		}
		int map = service.updateMainPetition(selectedNumber, petitionNo);
		req.getServletContext().setAttribute("mainPtList", null);
		

		return "redirect:/adminPetitionList";

	}

	@GetMapping("/adminQnA")
	public String selectQnAList(
		  @RequestParam(value="cp", required=false, defaultValue="1") int cp
		  ,Model model,@RequestParam Map<String, Object> paramMap) {
		
		Map<String, Object> map = service.selectQnAList(paramMap, cp);
		model.addAttribute("map", map);
		
		
		return "admin/adminQnA";
	}
	
	
	// 청원 상세 조회
	@GetMapping("/{petitionNo:[0-9]+}")
	public String petitionDetail(
	
		@PathVariable("petitionNo") int petitionNo
			,Model model
			,RedirectAttributes ra ){//리다이렉트 시 데이터 전달용 객체 
		
		// 만들어서 보내기
		
		
		//청원 상세 조회 서비스 호출
		Petition petition = service.selectPetition(petitionNo); // DAO에서는 매개변수를 1개밖에 못 보내니까..Map으로 -> Map을 만들어서 보내자~
		
		String path = null;
		if(petition != null) {// 조회 결과가 있을 경우
			path = "admin/adminPetitionDetail"; // forward할 jsp 경로
			
			model.addAttribute("petition", petition);
			
			
		}else {// 조회 결과 없을 경우
			path = "redirect:/adminPetitionList";
			// 청원 조회 페이지로 리다이렉트
			
			ra.addFlashAttribute("message", "해당 청원이 존재하지 않습니다.");
		}
		
		return path;
		
	}
	
	// 유저 목록 조회
	@GetMapping("/adminUserList")
	private String selectUserList(
			@RequestParam(value="cp", required=false, defaultValue="1") int cp
			,Model model) {
		
		Map<String, Object> map = service.selectUserList(cp);
		
		// 조회 결과를 request scope에 세팅 후 forward
		model.addAttribute("map", map);
		return "admin/adminUserList";
		
	}
	
	@PostMapping("/adminUserDelete")
	private String updateUser(@RequestParam("userNo") int userNo
								, Model model
								,@ModelAttribute User user
								,RedirectAttributes ra) throws IllegalStateException, IOException{
		
		int result = service.deleteUser(userNo);

		String message = null;
		String path = "redirect:";
		
		if(result > 0) {
			message = "유저가 삭제 되었습니다.";
			path += "/adminUserList";
			
		}else {
			message = "유저 삭제 실패........";
			path += "/adminUserList";
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
	}

	// 청원삭제 버튼
	@PostMapping("/adminPetitionDelete")
	private String updatePetition(@RequestParam("petitionNo") int petitionNo
								  ,@ModelAttribute Petition petition
								  , Model model
								  ,RedirectAttributes ra)throws IllegalStateException, IOException{
									
		int result = service.deletePetition(petitionNo);

		String message = null;
		String path = "redirect:";
		
		if(result > 0) {
			message = "청원이 삭제 되었습니다.";
			path += "/adminPetitionList";
			
		}else {
			message = "청원 삭제 실패........";
			path += "/adminPetitionList";
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
		
	}
	
	@GetMapping("/adminPetitionDelList")
	private String selectDelPetitionList(
						@RequestParam(value="cp", required=false, defaultValue="1") int cp
						,Model model
						,@RequestParam Map<String, Object> paramMap) {
		
		Map<String, Object> map = service.selectPetitionDelList(cp);
		
		// 조회 결과를 request scope에 세팅 후 forward
		model.addAttribute("map", map);
		return "admin/adminPetitionDelList";
	}
	
	@PostMapping("/adminUpdateDelPetition")
	private String updateDelPetition(@RequestParam("petitionNo") int petitionNo
									,@ModelAttribute Petition petition
									, Model model
									,RedirectAttributes ra) throws IllegalStateException, IOException{
										int result = service.updateDelPetition(petitionNo);

			String message = null;
			String path = "redirect:";
			
			if(result > 0) {
				message = "청원이 삭제 되었습니다.";
				path += "/adminPetitionDelList";
				
			}else {
				message = "청원 삭제 실패........";
				path += "/adminPetitionDelList";
			}
			
			ra.addFlashAttribute("message", message);
			
			return path;
	}
	
	
	// 삭제된 유저 목록 조회
	@GetMapping("/adminDelUserList")
	public String selectDelUserList(
	    @RequestParam(value="cp", required=false, defaultValue="1") int cp2,
	    Model model
	) {
	    Map<String, Object> map2 = service.selectDelUserList(cp2);
	    model.addAttribute("map2", map2);
	    
	    return "admin/adminDelUserList";
	}

	
	
	@PostMapping("/adminUserDeleteCancle")
	private String updateDelUser(@RequestParam("userNo") int userNo
			, Model model
			,@ModelAttribute User user
			,RedirectAttributes ra) throws IllegalStateException, IOException{

			int result = service.updateDeleteUser(userNo);
			
			String message = null;
			String path = "redirect:";
			
			
			ra.addFlashAttribute("message", message);
			
			return "redirect:/adminDelUserList";
}
	
	
	
}

