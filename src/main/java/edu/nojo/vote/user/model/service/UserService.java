package edu.nojo.vote.user.model.service;

import edu.nojo.vote.user.model.dto.User;

public interface UserService {

	
	
	/** 로그인 성공
	 * @param inputUser
	 * @return email,pw가 일치하는 회원 정보 또는 null
	 */
	User login(User inputUser);

	
	
	/** 회원가입
	 * @param inputUser
	 * @return result
	 */
	int signUp(User inputUser);

}
