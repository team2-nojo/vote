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
	private String petitionDelFl;
	
	//회원 join
	private int userNo;
	
	//카테고리 join
	private int categoryNo;
	
	// 좋아요
	private int petitionLikeNo;
	
	// 좋아요수
	private int petitionLikeCount;
	

    

   



}
