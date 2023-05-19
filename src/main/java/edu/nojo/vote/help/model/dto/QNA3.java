package edu.nojo.vote.help.model.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QNA3 {
	private int qnaNo;
	private int qnaCatCode;
	private String qnaTitle;
	private String qnaCont;
	private String qnaStatus;
	private String qnaCreateDt;
}
