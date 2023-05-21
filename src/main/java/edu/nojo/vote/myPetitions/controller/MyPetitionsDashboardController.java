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
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dto.Like;
import edu.nojo.vote.myPetitions.model.service.MyPetitionsDashboardService;
import edu.nojo.vote.user.model.dto.User;

@SessionAttributes({"loginMember"}) 
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
		
		model.addAttribute("myPetition", myPetition);
		model.addAttribute("likeUserList", likeUserList);
		
		return "/myPetitions/myPetitionsDashboard";

	}
	
	
	@PostMapping(value="/selectSuppoter", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Like> selectSuppoter(@RequestBody String petitionNo) {
		int pno = Integer.parseInt(petitionNo);
		return service.resetlikeUserList(pno);
	}
	
	@PostMapping(value="/selectComment", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Like> selectComment(@RequestBody String petitionNo) {
		int pno = Integer.parseInt(petitionNo);
		return service.resetcommentList(pno);
	}
	
	
	
	
	
	// 작성된 글 상태 확인후 추가가능한 부분 체크리스트
	
	
}
