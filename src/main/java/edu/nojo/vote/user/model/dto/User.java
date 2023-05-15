package edu.nojo.vote.user.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class User {

	private int userNo; // 회원번호
	private String userEmail; // 회원이메일
	private String userPw; // 비밀번호
	private String userGrade; // 회원등급
	private String userNickname; // 닉네임
	private String userAdd; // 회원주소
	private String userEndrollDt; // 가입일
	private String userDelFl; // 탈퇴여부
	

}