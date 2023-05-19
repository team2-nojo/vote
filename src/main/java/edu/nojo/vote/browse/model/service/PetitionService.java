package edu.nojo.vote.browse.model.service;

import java.util.List;

import edu.nojo.vote.browse.model.dto.BrowsePetition;

public interface PetitionService {

	/** petition 목록 조회
	 * @return list
	 */
	List<BrowsePetition> selectBrowsePtList();

}
