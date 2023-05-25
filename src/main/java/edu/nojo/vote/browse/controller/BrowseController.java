package edu.nojo.vote.browse.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.nojo.vote.browse.model.dto.Browse;
import edu.nojo.vote.browse.model.service.BrowseService;
import edu.nojo.vote.browse.model.service.CommentService;

import edu.nojo.vote.main.model.dto.Petition;

import edu.nojo.vote.myPetitions.model.dto.Comment;
import edu.nojo.vote.myPetitions.model.dto.Like;
import edu.nojo.vote.myPetitions.model.dto.PetitionUpdate;
import edu.nojo.vote.myPetitions.model.service.MyPetitionsDashboardService;

import edu.nojo.vote.user.model.dto.User;


@Controller
@RequestMapping("/browse")
public class BrowseController {

	@Autowired
	private BrowseService service;

	@Autowired
	private CommentService service2; 
	
	@Autowired 
	private MyPetitionsDashboardService service3;
	
	@GetMapping("/browseSearch/{order}")
	public String browseSearch (
			@PathVariable("order") String order
			, Model model) {
		List<Petition> petitionList = service.loadPetitionList(0, order);
		model.addAttribute("petitionList", petitionList);
		
		return "/browse/browseSearch/browseSearch";
	}
	
	@GetMapping("/load-{order}")
	@ResponseBody
	public List<Petition> loadPetition(
			@PathVariable("order") String order
			,@RequestParam int page) {
		List<Petition> petitionList= service.loadPetitionList(page, order);
		return petitionList;
	}
	
	
	// petitionView 페이지 이동(details)
	@GetMapping("/petitionView/details/{petitionNo}")
	public String details(@PathVariable("petitionNo") int petitionNo
						, Model model
						, RedirectAttributes ra
						, @SessionAttribute(value="loginUser", required=false) User loginUser
						){
		Petition petition = service.selectPetitionList(petitionNo); 
		List<Like> commentList = service3.resetcommentList(petitionNo);
		List<Like> resetlikeUserList = service3.selectlikeUserList(petitionNo);
		
		
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("petition", petition);
		model.addAttribute("commentList", commentList);
		model.addAttribute("resetlikeUserList", resetlikeUserList);
		
		
		
//		System.out.println(petition);
		
//		if(loginUser != null) { // 로그인 상태인 경우
//			// 회원번호를 map에 추가 
//			
//			Map<String, Object> map = new HashMap<String, Object>();
//			map.put("loginUser", loginUser.getUserNo());
		
//			
//			// 좋아요  여부 확인 서비스 호출
//			int result = service.petitionLikeCheck(map);
//			
//			// 누른 적이 있을 경우
//			if(result>0) model.addAttribute("likeCheck", "on");
//		}
		
		
		return "/browse/petitionView/details";
	}
	
	

	
	
	// suppoter list
	@PostMapping(value="/selectSuppoter", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Like> selectSuppoter(@RequestBody String petitionNo) {
		int pno = Integer.parseInt(petitionNo);
		return service3.resetlikeUserList(pno);
	}
	
	
	

	
	
	
	// petitionView 페이지 이동(update)
	@GetMapping("/petitionView/update/{petitionNo}")
	public String update(@PathVariable("petitionNo") int petitionNo
			, Model model
			, RedirectAttributes ra
			){
		
		List<PetitionUpdate> updatePetitionList = service.updatePetitionList(petitionNo);
		model.addAttribute("updatePetitionList", updatePetitionList);
		return "/browse/petitionView/updates";
	}
	
	
	


	
	
	// 댓글 삽입
	@PostMapping("/petitionView/details/comment")
	@ResponseBody
	public int insert(@RequestBody Comment comment) {
		// 요청 데이터 (JSON)을 HttpMessageConverter가 해석해서 Java객체(comment)에 대입
		
		int result = service2.insert(comment);
//		System.out.println(result);
		
		return result;
	}
	
	
	
	
	// 청원 좋아요
	// 좋아요 처리
	@PostMapping("/petitionView/details/like")
	@ResponseBody // 반환되는 값이 비동기 요청한 곳으로 돌아가게 함
	public int petitionLike(@RequestBody Map<String, Integer> paramMap) {
		
		int result = service.petitionLike(paramMap);
		
//			System.out.println(service.petitionLike(paramMap));
		return result;
	}

	
	
	
	
	
	
	
	// petitionView 페이지 이동(comments)
	@GetMapping("/petitionView/comments/{petitionNo}")
	public String comments(Model model, @PathVariable("petitionNo") int petitionNo) {
		// 해당 청원에 대한 댓글 조회
		List<Browse> commentList = service2.selectComments(petitionNo);
//		System.out.println(commentList);
		model.addAttribute("commentList", commentList);

		return "/browse/petitionView/comments";
	}


	
	
	
	
	
	
	
	// petitionView 페이지 이동(updates)
	@GetMapping("/petitionView/updates")
	public String updates() {
		return "/browse/petitionView/updates";
	}

	
	// petitionView 페이지 이동(updates_detail)
	@GetMapping("/petitionView/updates_detail")
	public String updates_detail() {
		return "/browse/petitionView/updates_detail";
	}	
	

	
	// 정책위반신고 페이지 이동
	@GetMapping("/petitionView/report_popUp")
	public String report_popUp() {
		return "/browse/petitionView/report_popUp";
	}
}