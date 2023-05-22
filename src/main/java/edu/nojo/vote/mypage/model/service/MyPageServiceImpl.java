package edu.nojo.vote.mypage.model.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.nojo.vote.mypage.model.dao.MyPageDAO;
import edu.nojo.vote.user.model.dto.User;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDAO dao;
	@Autowired
	private BCryptPasswordEncoder bcrypt;

	// 닉네임 중복 검사
	@Override
	public int checkNickname(String nickname) {
		return dao.checkNickname(nickname);
	}



   // 프로필 이미지 수정 서비스
   @Transactional(rollbackFor = {Exception.class})
   @Override
   public int updateProfileImage(MultipartFile profileImage, String path, String filePath, User loginUser) throws IllegalStateException, IOException {
      // 프로필 이미지 변경 실패 대비
            String temp = loginUser.getUserImage(); // 이전 이미지 저장
                        
            if(profileImage.getSize() > 0) { // 업로드된 이미지가 있을 경우      
               // loginMember에 파일 세팅
               loginUser.setUserImage(path);
            } else { // 없는 경우
               loginUser.setUserImage(null);
               return 1;
               // 세션 이미지를 null로 변경해서 삭제
            }
            
            // 프로필 이미지 수정 DAO 메서드 호출
            int result = dao.updateProfileImage(loginUser);
            
            System.out.println(result);
            
            if(result > 0) { // 성공
               // 새 이미지가 업로드된 경우
            	profileImage.transferTo(new File(filePath));
            } else { // 실패
               // 이전 이미지로 프로필 다시 세팅
               loginUser.setUserImage(temp);
            }
		return result;
	}

	// DB 회원 정보 수정(UPDATE) 서비스 호출
	@Transactional(rollbackFor = { Exception.class })
	@Override
	public int updateProfile(User updateUser) {
		return dao.updateProfile(updateUser);
	}

	// 해당 유저 조회 서비스
	@Override
	public User selectUser(int userNo) {
		return dao.selectUser(userNo);
	}
	
	@Override
	public int changePassword(int userNo, String currentPassword, String newPassword) {
		
		
		
		return 0;
	}

}