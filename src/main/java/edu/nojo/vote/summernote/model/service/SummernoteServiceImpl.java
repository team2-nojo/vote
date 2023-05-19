package edu.nojo.vote.summernote.model.service;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import edu.nojo.vote.common.utility.Util;

@Service
public class SummernoteServiceImpl implements SummernoteService{
	
	@Override
	public String uploadSummernoteImageFile(MultipartFile multipartFile, String webPath, String filePath) throws IllegalStateException, IOException {
		JsonObject jsonObject = new JsonObject();
		// String originalFileName = multipartFile.getOriginalFilename(); // 실제 파일 명
		String rename = Util.fileRename(multipartFile.getOriginalFilename());
		
		multipartFile.transferTo(new File(filePath + rename));
		jsonObject.addProperty("url", webPath+rename);
		jsonObject.addProperty("responseCode", "success");
		
		return jsonObject.toString();
	}
}