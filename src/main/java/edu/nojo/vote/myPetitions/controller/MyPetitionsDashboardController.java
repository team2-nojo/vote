package edu.nojo.vote.myPetitions.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dto.Comment;
import edu.nojo.vote.myPetitions.model.dto.Like;
import edu.nojo.vote.myPetitions.model.service.MyPetitionsDashboardService;
import edu.nojo.vote.user.model.dto.User;
import edu.nojo.vote.writePetition.model.dto.PetitionCategory;

@RequestMapping("/myPetitions")
@Controller
public class MyPetitionsDashboardController {

	@Autowired 
	private MyPetitionsDashboardService service;
	
	
	// myPetitionsDashboard 대시보드 페이지로 이동
	@GetMapping("/myPetitionsDashboard/{petitionNo}")
	public String myPetitionsDashboard(
							  @SessionAttribute User loginUser
							, Model model
							, @PathVariable("petitionNo") int petitionNo
									) throws ParseException{
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loginUserNo", loginUser.getUserNo());
		map.put("petitionNo", petitionNo);
		
		// 청원 조회 서비스 호출
		Petition myPetition = service.selectMyPetition(map);

		// 청원 좋아요 누른 회원 리스트 조회 서비스 호출
		List<Like> likeUserList = service.selectlikeUserList(petitionNo);
		
		// 형변환할 날짜형식 선언
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 현재시간
		Date now = new Date();
		
		for(Like like : likeUserList) {
			
			Date date = dateFormat.parse(like.getPetitionLikeDate());
			
			// 시간 차이 계산
	        long timeDif = now.getTime() - date.getTime();

	        long daysDif = timeDif / (24 * 60 * 60 * 1000); // 일
	        long hoursDif = (timeDif % (24 * 60 * 60 * 1000)) / (60 * 60 * 1000); // 시간
	        long minutesDif = (timeDif % (60 * 60 * 1000)) / (60 * 1000); // 분

	        like.setPetitionLikeDate(daysDif+"일 "+hoursDif+"시간 "+minutesDif+"분");
			
		}
		
		// 댓글 목록 조회
		List<Comment> commentList = service.resetcommentList(petitionNo);
		
		// 카테고리 유무 체크
		List<PetitionCategory> catagoryCheck = service.catagoryCheck(petitionNo);
		
		
		model.addAttribute("myPetition", myPetition);
		model.addAttribute("likeUserList", likeUserList);
		model.addAttribute("commentList", commentList);
		model.addAttribute("catagoryCheck", catagoryCheck);
		model.addAttribute("loginUser",loginUser);
		
		return "/myPetitions/myPetitionsDashboard";

	}
	
	// suppoter list(지지자목록)
	@PostMapping(value="/selectSuppoter", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Like> selectSuppoter(@RequestBody String petitionNo) {
		int pno = Integer.parseInt(petitionNo);
		return service.resetlikeUserList(pno);
	}
	
	// comment list(댓글목록)
	@PostMapping(value="/selectComment", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Comment> selectComment(@RequestBody String petitionNo) {
		int pno = Integer.parseInt(petitionNo);
		return service.resetcommentList(pno);
	}
	
	// petitonDelete(청원삭제)
	@PostMapping(value="/petitonDelete", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int petitonDelete(@RequestBody String petitionNo) {
		int pno = Integer.parseInt(petitionNo);
		return service.petitonDelete(pno);
	}
	
	// petitonVictory(청원승리전환)
	@PostMapping(value="/petitonVictory", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public int petitonVictory(@RequestBody String petitionNo) {
		int pno = Integer.parseInt(petitionNo);
		return service.petitonVictory(pno);
	}
	
	
    // exportList-Email(이메일로 목록 보내기)
    @PostMapping(value="/exportList", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public int exportList(@SessionAttribute User loginUser, @RequestBody Map<String, Object> data) {
        
    	data.put("loginUserEmail", loginUser.getUserEmail());
    	
        int result = service.exportList(data);
        
        return result;
        
    }
	
	
	
	
	
}
