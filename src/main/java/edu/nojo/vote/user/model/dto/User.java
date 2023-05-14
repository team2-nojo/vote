package edu.nojo.vote.user.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@Getter
@Setter
@ToString
public class User {
	private int userNo;
	private String userEmail;
	private String userPw;
	private String userName;
	private String profileImage;
}