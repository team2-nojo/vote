package edu.nojo.vote.myPage.model.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import edu.nojo.vote.user.model.dto.User;

public interface MyPageService {

	/** nickname 중복 검사
	 * @param nickname
	 * @return count
	 */
	int checkNickname(String nickname);

	/** 프로필 이미지 수정 서비스
	 * @param userImage
	 * @param path
	 * @param loginUser
	 * @return result
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	int updateProfile(MultipartFile userImage, String path, User loginUser) throws IllegalStateException, IOException;
	
}
