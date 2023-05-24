package edu.nojo.vote.main.model.dto;

import java.util.List;

import edu.nojo.vote.writePetition.model.dto.PetitionCategory;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Petition {
	
	private int petitionNo;
	private String petitionTitle;
	private String petitionContent;
	private String petitionDate;
	private int petitionViewCount;
	private String petitionVictory;
	private String petitionImage;
	private String petitionDelFl;
	private int orderNo;
	
	// 회원 join
	private int userNo;
	private String userImage;
	private String userNickname;
	private String userAddress;
	
	
	// 카테고리
	private List<PetitionCategory> categoryList;
	
	// 좋아요 수
	private int petitionLikeCount;
}
