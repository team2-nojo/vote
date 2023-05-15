package edu.nojo.vote.myPetitions.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Petition {
	
	private int ptNo; // 글번호
	private String ptTitle; // 글제목
	private String ptContent; // 글내용
	private String ptDate; // 작성일
	private int ptViewCount; // 글조회수
	private String ptVict; // 승리여부
	private String ptDelFl; // 삭제여부
	
	private String userNo; // 회원번호
	
	private int ptLikeNo; // 글 좋아요 번호
	
	
	
}
