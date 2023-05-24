package edu.nojo.vote.browse.model.service;

import java.util.List;
import java.util.Map;

import edu.nojo.vote.main.model.dto.Petition;

public interface BrowseService {

	/** 인기순으로 조회
	 * @return popularList
	 */
	List<Petition> popular();

	/** 최신순으로 조회
	 * @return recentList
	 */
	List<Petition> recent();

	/** 승리한 청원 조회(최신순)
	 * @return victoriesList
	 */
	List<Petition> victories();

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


}
