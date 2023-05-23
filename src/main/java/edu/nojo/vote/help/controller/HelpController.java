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
	
	@GetMapping("/FAQ")
	public String FAQ(    	
			@RequestParam(value="cp", required=false, defaultValue="1") int cp
	    	, Model model
	    	, @RequestParam Map<String, Object> paramMap) {
	    	
	    	Map<String, Object> map = service.FAQ(paramMap, cp);
	    	model.addAttribute("map", map);
	   
		return "/clientCenter/FAQ";
	}
	
    @GetMapping("/popup")
    public String popup() {
    	
    	return "/clientCenter/popup";
    }
    
    @GetMapping("/QNA")
    public String qna() {
    	return "/clientCenter/QNA";
    }
    
    
    
    
    
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
    
    @GetMapping("/chatbot")
    public String chatbot() {
    		
    	return "/clientCenter/chatbot";
    }    
    
    @GetMapping("/QNA3")
    public String QA3(
    	@RequestParam(value="cp", required=false, defaultValue="1") int cp
    	, Model model,
    	@RequestParam Map<String, Object> paramMap) {
    	
    	Map<String, Object> map = service.QA3(paramMap, cp);
    	model.addAttribute("map", map);
    	
  
    	return "/clientCenter/QNA3";
    } 
    
    
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
    
	// 게시글 수정 화면 전환
	@GetMapping("/QNAupdate/{qnaNo}")
	public String qnaUpdate(
		 @PathVariable("qnaNo") int qnaNo
		,Model model) {
		// Model : 데이터 전달용 객체(기본 scope : request)
		
		Map<String, Object> map = new HashMap<>();
		map.put("qnaNo", qnaNo);
		
		QNA3 qna3 = service.selectqna(map);
		
		/* if(로그인회원번호 != 작성자 번호) 리다이렉트 */
		model.addAttribute("qna", qna3);

		// forward(요청 위임) -> request scope 유지
		return "clientCenter/QNAupdate";
	}
	
    
    
    
    
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
    
    
    
    
    
    
    
}
    

   
    

