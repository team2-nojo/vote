package edu.nojo.vote.common;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;

public class ExceptionController {
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e, Model model) {
		
		
		e.printStackTrace(); // 예외 내용/발생 메서드 확인
		model.addAttribute("e", e);
		
		return "common/error";
	}	

}
