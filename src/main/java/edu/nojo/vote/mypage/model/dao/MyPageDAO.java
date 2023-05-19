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
      return sqlSession.update("myPageMapper,updateProfileImage", loginUser);
   }


   
}