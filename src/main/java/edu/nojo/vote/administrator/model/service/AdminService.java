package edu.nojo.vote.administrator.model.service;

import java.util.Map;

public interface AdminService {

	
	/** 청원 목록 조회
	 * 
	 * */

	Map<String, Object> selectPetitionList(int cp);
}
