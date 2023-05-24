package edu.nojo.vote.browse.controller;


import java.security.Provider.Service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.nojo.vote.browse.model.dto.Browse;
import edu.nojo.vote.browse.model.service.CommentService;

import edu.nojo.vote.browse.model.service.BrowseService;
import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dto.Comment;
import edu.nojo.vote.myPetitions.model.dto.Like;
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
		List<Petition> recentList = service.recent();
		model.addAttribute("recentList", recentList);
		
		return "/browse/browse_search/recent";
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
						, @SessionAttribute(value="loginUser", required=false) User loginUser
						){
		
		
		Petition petition = service.selectPetitionList(petitionNo); 
		
		model.addAttribute("petition", petition);
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
//		
		
		
		
		
		return "/browse/petitionView/details";
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
			System.out.println(paramMap);
			return service.petitionLike(paramMap);
		}
	
	
	
	
	
	// petitionView details(comments)
	@GetMapping("/petitionView/details/selectComment")
	public String comment(Model model, @PathVariable("petitionNo") int petitionNo) {
		// 해당 청원에 대한 댓글 조회
		List<Comment> selectCommentList = service2.selectCommentList(petitionNo);
		System.out.println(selectCommentList);
		model.addAttribute("selectCommentList", selectCommentList);

		return "/browse/petitionView/details/selectComment";
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