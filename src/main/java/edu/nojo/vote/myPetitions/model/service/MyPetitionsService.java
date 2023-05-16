package edu.nojo.vote.myPetitions.model.service;

import java.util.List;

import edu.nojo.vote.main.model.dto.Petition;

public interface MyPetitionsService {

	/** 로그인 한 멤버의 회원 번호를 이용해 작성한 글 조회
	 * @param userNo
	 * @return petitionList
	 */
	List<Petition> selectMyPetitions(int userNo);



}
