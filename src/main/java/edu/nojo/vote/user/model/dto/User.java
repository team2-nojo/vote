package edu.nojo.vote.user.model.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@ToString
public class User {
	
	private int userNo;						// 회원 번호
	private String userGrade;				// 회원 등급
	private String userImage;				// 회원 이미지
	private String userEmail;				// 회원 이메일
	private String userNickname;			// 회원 닉네임
	private String userPw;					// 회원 비밀번호
	private String userAddress;				// 회원 주소
	private String userAboutMe;				// 회원 자기소개
	private String userSocialLogin;			// 회원 소셜로그인
	private String userEnrollDate;			// 회원 가입일
	private String userDelFl;
	private int userWriteCount;
	
	List<Integer> emailSettings;

	public User() {}
	
	public User(int userNo, String userEmail, String userPw, String userNickname, String userImage) {
		super();
		this.userNo = userNo;
		this.userEmail = userEmail;
		this.userPw = userPw;
		this.userNickname = userNickname;
		this.userImage = userImage;
	}
}