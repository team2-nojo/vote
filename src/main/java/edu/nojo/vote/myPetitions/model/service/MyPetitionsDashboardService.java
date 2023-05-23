package edu.nojo.vote.myPetitions.model.service;

import java.util.List;
import java.util.Map;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dto.Like;
import edu.nojo.vote.user.model.dto.User;
import edu.nojo.vote.writePetition.model.dto.PetitionCategory;

public interface MyPetitionsDashboardService {

	/** 청원 조회 서비스
	 * @param map
	 * @return
	 */
	Petition selectMyPetition(Map<String, Object> map);

	/** 청원 좋아요 누른 회원 리스트 조회 서비스
	 * @param petitionNo
	 * @return
	 */
	List<Like> selectlikeUserList(int petitionNo);

	/** 청원 좋아요 누른 회원 리스트 최신화
	 * @param pno
	 * @return
	 */
	List<Like> resetlikeUserList(int pno);

	/** 댓글 목록 조회
	 * @param pno
	 * @return
	 */
	List<Like> resetcommentList(int pno);

	/** 카테고리 유무 체크
	 * @param petitionNo
	 * @return
	 */
	List<PetitionCategory> catagoryCheck(int petitionNo);

	/** 청원 삭제
	 * @param pno
	 * @return
	 */
	int petitonDelete(int pno);

	/** 청원 승리
	 * @param pno
	 * @return
	 */
	int petitonVictory(int pno);


}
