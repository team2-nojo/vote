package edu.nojo.vote.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nojo.vote.user.model.dao.UserDAO;
import edu.nojo.vote.user.model.dto.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO dao;
	
	
	// 로그인 서비스
	@Override
	public User login(User inputUser) {
		
		// 이메일 일치하는 회원 정보 얻어오기
		User loginUser = dao.login(inputUser);
		
		
		// 이메일 일치하는 회원 존재 여부
		if(loginUser != null) { // 있을경우
			// 비밀번호 암호화 된거랑 안된거 비교 - 지금은 구현안됨( 유저2 일경우만 로그인 가능)
			if(loginUser.getUserPw().equals("pass02!")) { 
				loginUser.setUserPw(null);
			}else {
				loginUser = null;
			}
		}
		return loginUser;
	}
	
}
