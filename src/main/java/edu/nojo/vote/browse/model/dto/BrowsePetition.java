package edu.nojo.vote.browse.model.dto;


import java.util.List;

import edu.nojo.vote.main.model.dto.Petition;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BrowsePetition {
	


	
	
	// RESP
	private int commentRESPNo;
	private int commentRESP;
	

    // comment
	private int commentNo;
	private String commentContent;
	private String commentDate;
	private String commentDelFl;
	
	
	// update
	private int updateNo;
	private String updateTitle;
	private String updateContent;
	private String updateDate;
	private String updateImage;
	private String updateDelFl;
	
	
   



}
