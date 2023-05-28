package edu.nojo.vote.user.model.service;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		// 이메일 일치하는 회원 정보 얻어오기
		User loginUser = dao.login(inputUser);
		
		// 이메일 일치하는 회원 존재 여부
		if(loginUser != null) { // 있을경우
			// 비밀번호 암호화 된거랑 안된거 비교
			if(bcrypt.matches(inputUser.getUserPw(), loginUser.getUserPw())) { // loginUser암호와 안됨(DB는 암호화 함)
				loginUser.setUserPw(null); // 비밀번호 유지 불필요하므로 로그인 정보에서 제거
				loginUser.setEmailSettings(dao.selectEmailSettings(loginUser.getUserNo()));
			}else {
				loginUser = null;
			}
		}
		return loginUser;
	}
	
	
	// 회원가입
	@Transactional(rollbackFor = {Exception.class}) 
	@Override
	public int signUp(User inputUser, String agreeEmail) {
		// 비밀번호 암호화 후 inputUser에 세팅
		String encPw = bcrypt.encode(inputUser.getUserPw());
		inputUser.setUserPw(encPw);
		// DAO호출 결과로 성공한 갯수 받음
		int result =  dao.signUp(inputUser);
		
		if(agreeEmail.equals("y")) {
			inputUser.setEmailSettings(new ArrayList<>(Arrays.asList(1,2,3,4,5))); 
		} else if (agreeEmail.equals("n")){
			inputUser.setEmailSettings(new ArrayList<>(Arrays.asList(0)));
		}
		dao.insertEmailSettings(inputUser);
		
		return result;
	}
	
	
	
	// 이메일 중복 확인
	@Override
	public int checkEmail(String email) {
		return dao.checkEmail(email);
	}
	
	// 닉네임 중복 검사
	@Override
	public int checkNickname(String nickname) {
		return dao.checkNickname(nickname);
	}

	
}
