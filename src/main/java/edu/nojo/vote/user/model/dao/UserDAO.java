package edu.nojo.vote.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nojo.vote.user.model.dto.User;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 로그인 DAO
	 * @param inputUser
	 * @return 회원 정보 또는 null
	 */
	public User login(User inputUser) {
		
		return sqlSession.selectOne("userMapper.login",inputUser);
	}

	
	
	/** 회원가입
	 * @param inputUser
	 * @return result
	 */
	public int signUp(User inputUser) {
		return sqlSession.insert("userMapper.signUp", inputUser);
	}
	
	
	
	/**이메일 중복 검사
	 * @param email
	 * @return count
	 */
	public int checkEmail(String email) {
		return sqlSession.selectOne("userMapper.checkEmail", email);
	}
	 
	
	/** 닉네임 중복 검사
	 * @param nickname
	 * @return count
	 */
	public int checkNickname(String nickname) {
		return sqlSession.selectOne("userMapper.checkNickname", nickname);
	}

	public List<Integer> selectEmailSettings(int userNo) {
		return sqlSession.selectList("userMapper.selectEmailSettings",userNo);
	}
	
	public int insertEmailSettings(User user) {
		return sqlSession.insert("myPageMapper.insertEmailSettings", user);
	}
}
