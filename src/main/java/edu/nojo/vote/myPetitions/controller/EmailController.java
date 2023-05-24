package edu.nojo.vote.myPetitions.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dto.Like;
import edu.nojo.vote.myPetitions.model.service.EmailService;
import edu.nojo.vote.myPetitions.model.service.MyPetitionsDashboardService;
import edu.nojo.vote.user.model.dto.User;

@Controller
@RequestMapping("/sendEmail")
public class EmailController {

    @Autowired
    private EmailService service;
    
    @Autowired
    private MyPetitionsDashboardService dashboardService;
    
    @GetMapping("/update")
    @ResponseBody
    public int update(@SessionAttribute User loginUser
    				, @RequestParam(value="petitionNo", required=false) int petitionNo) {
    	
    	// 청원 번호로 좋아요 한 사람 목록 조회
    	List<Like> likeUserList = dashboardService.selectlikeUserList(petitionNo);
		
    	// 
    	
        return service.update(petitionNo, "회원 가입");
    }
    
    
//    @GetMapping("/checkAuthKey")
//    @ResponseBody
//    public int checkAuthKey(@RequestParam Map<String, Object> paramMap){
//
//    	System.out.println(paramMap); // {inputKey=wc3rxG, email=knbdh@nate.com}
//        
//        return service.checkAuthKey(paramMap);
//    }
	
}
