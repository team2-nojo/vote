package edu.nojo.vote.myPetitions.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Like {

	private int petitionLikeNo;		
	private int petitionNo;			
	private String petitionLikeDate;
	
	private int userNo;				
	
	private String userImage;			
	private String userEmail;			
	private String userNickname;		
	private String userAddress;
	
	
	private String commentContent;
}
