package edu.nojo.vote.mypage.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nojo.vote.user.model.dto.User;

@Repository
public class MyPageDAO {

   
   @Autowired
   private SqlSessionTemplate sqlSession;

   public int checkNickname(String nickname) {
      return sqlSession.selectOne("myPageMapper.checkNickname", nickname);
   }

   /**프로필 이미지 수정
    * @param loginUser
    * @return result
    */
   public int updateProfileImage(User loginUser) {
      return sqlSession.update("myPageMapper.updateProfileImage", loginUser);
   }

   
   /** 회원 정보 수정 DAO
	 * @param updateUser
	 * @return result
	 */
	public int updateProfile(User updateUser) {
	      return sqlSession.update("myPageMapper.updateProfile", updateUser);
	}

	/** 해당 유저 조회 서비스
	 * @param userNo
	 * @return selectedUser
	 */
	public User selectUser(int userNo) {
		return sqlSession.selectOne("myPageMapper.selectUser", userNo);
	}

	public String selectEncryptedPassword(int userNo) {
		return sqlSession.selectOne("myPageMapper.selectEncryptedPassword",userNo);
	}

	public int changePassword(int userNo, String newPassword) {
		User user = new User();
		user.setUserNo(userNo);
		user.setUserPw(newPassword);
		return sqlSession.update("myPageMapper.changePassword",user);
	}

   
}