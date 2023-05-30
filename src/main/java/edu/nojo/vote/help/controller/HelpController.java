package edu.nojo.vote.help.controller;

import java.util.HashMap;
import java.util.Map;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.nojo.vote.help.model.dto.QNA3;
import edu.nojo.vote.help.model.service.HelpService;
import edu.nojo.vote.user.model.dto.User;

@SessionAttributes({ "loginUser" })
@RequestMapping("/clientCenter")
@Controller

public class HelpController {
	
	@Autowired
	private HelpService service;

	
	// FAQ 화면, 카테고리별로 아래 아코디언 메뉴 바뀌는
	@GetMapping("/FAQ")
	public String clientCenterFAQ(
		   @RequestParam(value="faqCatNo", required=false, defaultValue="1") int faqCatNo,
	       @RequestParam(value="cp", required=false, defaultValue="1") int cp,
	       Model model,
	       @RequestParam Map<String, Object> paramMap,
	       @SessionAttribute(value="loginUser", required=false) User loginUser
	       ) {
		
		
		// FAQ 카테고리 넘버를 통해 불러옴
		paramMap.put("faqCatNo", faqCatNo);
		
		
	    Map<String, Object> map = service.FAQList(paramMap, cp);
	    
	    model.addAttribute("map", map);
	    model.addAttribute("loginUser", loginUser);
	    
	    return "/clientCenter/FAQ";
	} 


	   	
	// 게시글 등록 시 뜨는 팝업창
    @GetMapping("/popup")
    public String popup() {
    	
    	return "/clientCenter/popup";
    }
    
    // 1:1 문의 등록
    @GetMapping("/QNA")
    public String qna() {
    	return "/clientCenter/QNA";
    }
    
    // 1:1 문의 등록
    @PostMapping("/QNA")
    public String QA(@SessionAttribute(value="loginUser", required=false) User loginUser
    	  , QNA3 qna3
    	  , RedirectAttributes ra
    	) {
        
    	qna3.setUserNo(loginUser.getUserNo());

    	
    	int qnaNo = service.helpInsert(qna3);
    	
    	String message = null;
    	String path = "redirect:";
    	
    	if(qnaNo > 0) {
    		message = "게시글이 등록 되었습니다.";
    		path += "QNA3";
    	} else {
    		message = "게시글이 등록되지 않았습니다";
    	    path += "insert";	
    	}
    	
    	ra.addFlashAttribute("message", message);

    	return path;
    }    
    
    
    // 1:1문의내역
    @GetMapping("/QNA3")
    public String QA3(
          @RequestParam(value="qnaCatCode", required=false, defaultValue="1") int qnaCatCode
    	, @RequestParam(value="cp", required=false, defaultValue="1") int cp
    	, Model model,
    	@RequestParam Map<String, Object> paramMap) {
    	
    	// QNA 카테고리 넘버를 통해 불러옴
    	paramMap.put("qnaCatCode", qnaCatCode);
		 Map<String, Object> map = service.QA3(paramMap, cp); 
    	
    	model.addAttribute("map", map);
    	
  
    	return "/clientCenter/QNA3";
    } 
    
    // 1:1문의내역 상세조회
    @GetMapping("/QNADetail/{qnaNo:[0-9]+}")
    public String qnaDetail(
    		@SessionAttribute(value="loginUser", required=false) User loginUser
      	  , Model model
      	  , RedirectAttributes ra
		, @PathVariable("qnaNo") int qnaNo
      	)  {
    	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qnaNo", qnaNo);
		
		QNA3 Qna3 = service.selectqna(map);
		
		String path = null;

		path = "clientCenter/QNADetail";
		model.addAttribute("qna", Qna3);
		
        return path;
     }
    
	// 1:1문의글 수정 화면 전환
	@GetMapping("/QNAupdate/{qnaNo}")
	public String qnaUpdate(
		 @PathVariable("qnaNo") int qnaNo
		,Model model) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("qnaNo", qnaNo);
		
		QNA3 qna3 = service.selectqna(map);
		
		model.addAttribute("qna", qna3);

		return "clientCenter/QNAupdate";
	}
	
    
	// 1:1문의글 수정
    @PostMapping("/QNAupdate/{qnaNo}")
    public String qnaUpdate(
    	QNA3 qna3
      , @PathVariable("qnaNo") int qnaNo 
      , RedirectAttributes ra
   )  {
    	
	qna3.setQnaNo(qnaNo);
    
    int rowCount = service.qnaUpdate(qna3);
    
	String message = null;
	String path = "redirect:";
	
	if(rowCount > 0) {
		message = "게시글이 수정되었습니다.";
		path += "/clientCenter/QNADetail/"+qnaNo;
	}else {
		message = "게시글 수정 실패";
		path += "/clientCenter/QNAupdate/"+qnaNo;
	}
	
	ra.addFlashAttribute("message", message);
	
	return path;
}
    
    // 1:1문의글 삭제
    @GetMapping("/QNAupdate/{qnaNo}/delete")
    public String qnaDelete(
    		  QNA3 qna3
    		, @PathVariable("qnaNo") int qnaNo
    		, RedirectAttributes ra) {
    	
    	int result = service.qnaDelete(qnaNo);
    	
		String message = null;
		String path = "redirect:";
		
		if(result > 0) {
			message = "삭제 되었습니다";
			path += "/clientCenter/QNA3";
		} else {
			message = "삭제 실패";
			path += "/clientCenter/QNADetail/" + qnaNo;
		}
			
		ra.addFlashAttribute("message", message);
		
		return path;
    	
    }
    
    
    
    
}
    

   
    

