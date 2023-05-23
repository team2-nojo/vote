package edu.nojo.vote.mypage.model.service;

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
	 * @param webpath
	 * @param loginUser
	 * @return result
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	int updateProfileImage(MultipartFile profileImage, String webpath, String filePath, User loginUser) throws IllegalStateException, IOException;

   /** DB 회원 정보 수정(UPDATE) 서비스
    * @param updateUser
    * @return result
    */
   int updateProfile(User updateUser);

	
	/** 해당 유저 조회 서비스 
	 * @param userNo
	 * @return selectedUser
	 */
	User selectUser(int userNo);


	/** 비밀번호 변경 서비스
	 * @param userNo
	 * @param currentPassword
	 * @param newPassword
	 * @return result
	 */
	int changePassword(int userNo, String currentPassword, String newPassword);



   
   
   
   
}