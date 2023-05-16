package edu.nojo.vote.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.nojo.vote.user.model.dao.UserDAO;
import edu.nojo.vote.user.model.dto.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAO dao;
	
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	
	// 로그인 서비스
	@Override
	public User login(User inputUser) {
		
//		System.out.println("암호화 확인 : " + bcrypt.encode(inputUser.getUserPw()));

		
		// 이메일 일치하는 회원 정보 얻어오기
		User loginUser = dao.login(inputUser);
		
		System.out.println(inputUser);
		System.out.println(loginUser);
		
		// 이메일 일치하는 회원 존재 여부
		if(loginUser != null) { // 있을경우
			// 비밀번호 암호화 된거랑 안된거 비교
			if(bcrypt.matches(inputUser.getUserPw(), loginUser.getUserPw())) { // loginUser암호와 안됨(DB는 암호화 함)
				loginUser.setUserPw(null); // 비밀번호 유지 불필요하므로 로그인 정보에서 제거
			}else { 
				loginUser = null;
			}
		}
		return loginUser;
	}
	
}
