package edu.nojo.vote.user.model.dao;

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
	
	
	
}
