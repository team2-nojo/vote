package edu.nojo.vote.summernote.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import edu.nojo.vote.summernote.model.service.SummernoteService;

@Controller
public class SummernoteController {
	
	@Autowired
	SummernoteService service;
	
	@PostMapping(value="/uploadSummernoteImageFile", produces="application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile
			, HttpSession session)  throws IllegalStateException, IOException {
		// 내부 경로로 저장
		String webPath = "/resources/images/summernote/";
		String filePath = session.getServletContext().getRealPath(webPath);
		// 업로드 서비스 호출
		return service.uploadSummernoteImageFile(multipartFile,webPath,filePath);
	}
	
	@PostMapping(value="/petitionUpdateUploadSummernoteImageFile", produces="application/json; charset=utf8")
	@ResponseBody
	public String petitionUpdateUploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile
			, HttpSession session)  throws IllegalStateException, IOException {
		// 내부 경로로 저장
		String webPath = "/resources/images/petitionUpdate/";
		String filePath = session.getServletContext().getRealPath(webPath);
		// 업로드 서비스 호출
		return service.uploadSummernoteImageFile(multipartFile,webPath,filePath);
	}
}