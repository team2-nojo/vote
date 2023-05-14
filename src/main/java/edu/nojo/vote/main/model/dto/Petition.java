package edu.nojo.vote.main.model.dto;

import lombok.Getter;

@Getter
public class Petition {
	
	private int petitionNo;
	private String petitionTitle;
	private String petitionContent;
	private String petitionDate;
	private int petitionViewCount;
	private String petitionVictory;
	private String petitionImage;
	
	//회원 join
	private int userNo;
	
	//카테고리 join
	private int categoryNo;
	
	

    

   



}
