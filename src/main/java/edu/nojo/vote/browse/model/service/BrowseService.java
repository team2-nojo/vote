package edu.nojo.vote.browse.model.service;

import java.util.List;

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


}
