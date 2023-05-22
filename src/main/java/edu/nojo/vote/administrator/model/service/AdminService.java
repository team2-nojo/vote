package edu.nojo.vote.administrator.model.service;

import java.util.Map;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.user.model.dto.User;

public interface AdminService {

	
	/** 청원 목록 조회
	 * 
	 * */

	Map<String, Object> selectPetitionList(int cp);


	int updateMainPetition(int selectedNumber, int petitionNo);


	Map<String, Object> selectQnAList(Map<String, Object> paramMap, int cp);


	Petition selectPetition(int petitionNo);


	/**청원 검색
	 * @param paramMap
	 * @param cp
	 * @return petitionList
	 * 
	 * */
	Map<String, Object> selectPetitionList(Map<String, Object> paramMap, int cp);



}
