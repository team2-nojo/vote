package edu.nojo.vote.myPetitions.model.service;

import java.util.List;
import java.util.Map;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.user.model.dto.User;

public interface MyPetitionsDashboardService {

	/** 청원 조회 서비스
	 * @param map
	 * @return
	 */
	List<Petition> selectMyPetition(Map<String, Object> map);

	/** 청원 좋아요 누른 회원 리스트 조회 서비스
	 * @param petitionNo
	 * @return
	 */
	List<Map> selectlikeUserList(int petitionNo);


}
