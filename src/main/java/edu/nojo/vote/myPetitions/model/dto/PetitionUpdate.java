package edu.nojo.vote.myPetitions.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PetitionUpdate {


	private int petitionUpdateNo;
	private String petitionUpdateTitle;
	private String petitionUpdateContent;
	private String petitionUpdateDate;
	private String petitionUpdateImage;
	private String petitionUpdateDeleteFlag;
	
	// 글 번호
	private int petitionNo;
	
	// 회원
	private int userNo;
	private String userNickname;
	
}
