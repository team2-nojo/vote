package edu.nojo.vote.administrator.model.service;

import java.util.Map;

import edu.nojo.vote.main.model.dto.Petition;

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


	/**유저 조회
	 * @param cp
	 * @return userList
	 * */
	Map<String, Object> selectUserList(int cp);



	/** 유저 삭제
	 * @param userNo
	 * @return
	 */
	int deleteUser(int userNo);


	
	/** 청원 삭제
	 * @param petitionNo
	 * @return
	 */
	int deletePetition(int petitionNo);


	
	
	/** 삭제된 청원 조회
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectPetitionDelList(int cp);


	/** 청원 복구
	 * @param petitionNo
	 * @return
	 */
	int updateDelPetition(int petitionNo);


	/**삭제된 유저 조회
	 * @param cp
	 * @return
	 */
	Map<String, Object> selectDelUserList(int cp2);

	

	

	/** 삭제된 유저 복구 버
	 * @param 
	 * @return
	 */
	int updateDeleteUser(int userNo);



}
