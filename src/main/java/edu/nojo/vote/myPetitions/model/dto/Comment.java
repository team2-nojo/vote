package edu.nojo.vote.myPetitions.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Comment {

	private int userNo;	
	private String userImage;			
	private String userNickname;	
	private String userEmail;
	
	private int petitionNo;		
	
	// 댓글
	private String commentNo;
	private String commentContent;
	private String commentDate;
	private String commentDelFL;
	
	// 댓글 반응
	private String commentFLY;
	private String commentFLN;
	
	
}
