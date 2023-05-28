package edu.nojo.vote.mypage.model.dao;

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

	/** 암호화된 유저 비밀번호 조회
	 * @param user
	 * @return EncryptedPassword
	 */
	public String selectEncryptedPassword(User user) {
		return sqlSession.selectOne("myPageMapper.selectEncryptedPassword",user);
	}

	/** 유저 비밀번호 변경
	 * @param user
	 * @return result
	 */
	public int changePassword(User loginUser) {
		return sqlSession.update("myPageMapper.changePassword",loginUser);
	}

	/** 유저에게 설정된 이메일 설정 전체 삭제
	 * @param user
	 * @return result
	 */
	public int deleteEmailSettings(User loginUser) {
		return sqlSession.delete("myPageMapper.deleteEmailSettings",loginUser);
	}

	public int insertEmailSettings(User loginUser) {
		return sqlSession.insert("myPageMapper.insertEmailSettings", loginUser);
	}

	public int secession(User loginUser) {
		return sqlSession.update("myPageMapper.secession",loginUser);
	}
	
	


   
}