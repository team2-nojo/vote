package edu.nojo.vote.browse.model.service;

import java.util.List;
import java.util.Map;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dto.PetitionUpdate;

public interface BrowseService {


	/** 청원 상세조회
	 * @param petitionNo
	 * @return list
	 */
	Petition selectPetitionList(int petitionNo);


	
	/** 청원 좋아요 확인
	 * @param map
	 * @return result
	 */
//	int petitionLikeCheck(Map<String, Object> map);

	/** 청원 좋아요
	 * @param paramMap
	 * @return count
	 */
	int petitionLike(Map<String, Integer> paramMap);

	
	
	/** 청원 업데이트 리스트 조회
	 * @param petitionNo
	 * @return updateList
	 */
	List<PetitionUpdate> updatePetitionList(int petitionNo);

	/** 청원 리스트 조회
	 * @param page
	 * @param order
	 * @return petitionList
	 */
	List<Petition> loadPetitionList(int page, String order);


	Map<String, Object> selectCategoryInfo(int categoryNo);



	List<Petition> selectPetitionList(int categoryNo, int page, String order);









}
