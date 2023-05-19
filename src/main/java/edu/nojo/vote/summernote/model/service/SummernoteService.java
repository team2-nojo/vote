package edu.nojo.vote.summernote.model.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface SummernoteService {

	String uploadSummernoteImageFile(MultipartFile multipartFile, String webPath, String filePath) throws IllegalStateException, IOException ;

}
