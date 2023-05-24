package edu.nojo.vote.browse.controller;


import java.util.List;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.nojo.vote.browse.model.dto.Browse;
import edu.nojo.vote.browse.model.service.BrowseService;
import edu.nojo.vote.browse.model.service.CommentService;
import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dto.Comment;
import edu.nojo.vote.myPetitions.model.dto.Like;
import edu.nojo.vote.myPetitions.model.service.MyPetitionsDashboardService;


@Controller
@RequestMapping("/browse")
public class BrowseController {

	@Autowired
	private BrowseService service;

	@Autowired
	private CommentService service2; 
	
	@Autowired 
	private MyPetitionsDashboardService service3;
	

	// browse 페이지 이동(popular)
	@GetMapping("/browse_search/popular")
	public String popular(Model model) {
		
		// popular로 조회
		List<Petition> popularList = service.popular();
		model.addAttribute("popularList", popularList);
		
		return "/browse/browse_search/popular";
	}
	
	
	// browse 페이지 이동(recent)
	@GetMapping("/browse_search/recent")
	public String recent(Model model) {
		
		// recent로 조회
		List<Petition> recentList = service.recent(0);
		model.addAttribute("recentList", recentList);
		
		return "/browse/browse_search/recent";
	}
	
	@GetMapping("/load-recent")
	@ResponseBody
	public List<Petition> loadRecent(@RequestParam int page) {
		List<Petition> recentList= service.recent(page);
		System.out.println(recentList);
		return recentList;
	}
	
	
	// browse 페이지 이동(victories)
	@GetMapping("/browse_search/victories")
	public String victories(Model model) {
		
		// victories 최신순으로 조회
		List<Petition> victoriesList = service.victories();
		model.addAttribute("victoriesList", victoriesList);
		
		return "/browse/browse_search/victories";
	}
	
	
	
	
	
	
	
	
	
		
	// petitionView 페이지 이동(details)
	@GetMapping("/petitionView/details/{petitionNo}")
	public String details(@PathVariable("petitionNo") int petitionNo
						, Model model
						, RedirectAttributes ra
						){
		
		
		Petition petition = service.selectPetitionList(petitionNo); 
		List<Comment> commentList = service2.resetcommentList(petitionNo);
		List<Like> likeUserList = service3.selectlikeUserList(petitionNo);

		
		
		model.addAttribute("petition", petition);
		model.addAttribute("commentList", commentList);
		model.addAttribute("likeUserList", likeUserList);
//		System.out.println(petition);
		
		
		return "/browse/petitionView/details";
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
	@PostMapping("/petitionView/details/")
	@ResponseBody
	public int insert(@RequestBody Comment comment) {
		// 요청 데이터 (JSON)을 HttpMessageConverter가 해석해서 Java객체(comment)에 대입
		
		int result = service2.insert(comment);
//		System.out.println(result);
		
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