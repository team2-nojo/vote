package edu.nojo.vote.browse.model.dto;



import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Browse {
	
	private int userNo;						// 회원 번호
	private String userImage;				// 회원 이미지
	private String userNickname;			// 회원 닉네임
	
	

	
	
	// comment
	private int commentNo;
	private String commentContent;
	private String commentDate;
	private String commentDelFl;

	
	
	// RESP
	private int commentRESPNo;
	private int commentRESP;
	

   
	
	// update
	private int updateNo;
	private String updateTitle;
	private String updateContent;
	private String updateDate;
	private String updateImage;
	private String updateDelFl;
	
	
   



}
