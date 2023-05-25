package edu.nojo.vote.myPetitions.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dto.Like;
import edu.nojo.vote.user.model.dto.User;
import edu.nojo.vote.writePetition.model.dto.PetitionCategory;

@Repository
public class MyPetitionsDashboardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 청원 조회
	 * @param map
	 * @return
	 */
	public Petition selectMyPetition(Map<String, Object> map) {
		return sqlSession.selectOne("myPetitionsMapper.selectMyPetition", map);
	}

	/** 청원 좋아요 누른 회원 리스트 조회
	 * @param petitionNo
	 * @return
	 */
	public List<Like> selectlikeUserList(int petitionNo) {
		return sqlSession.selectList("myPetitionsMapper.selectlikeUserList", petitionNo);
	}

	/** 청원 좋아요 누른 회원 리스트 최신화
	 * @param pno
	 * @return
	 */
	public List<Like> resetlikeUserList(int petitionNo) {
		return sqlSession.selectList("myPetitionsMapper.resetlikeUserList", petitionNo);
	}

	/** 댓글 목록 조회
	 * @param pno
	 * @return
	 */
	public List<Like> resetcommentList(int petitionNo) {
		return sqlSession.selectList("myPetitionsMapper.resetcommentList", petitionNo);
	}

	/** 카테고리 유무 체크
	 * @param petitionNo
	 * @return
	 */
	public List<PetitionCategory> catagoryCheck(int petitionNo) {
		return sqlSession.selectList("myPetitionsMapper.catagoryCheck", petitionNo);
	}

	/** 청원 삭제
	 * @param petitionNo
	 * @return
	 */
	
	public int petitonDelete(int petitionNo) {
		return sqlSession.update("myPetitionsMapper.petitonDelete", petitionNo);
	}

	
	/** 청원 승리 여부 확인
	 * @param petitionNo
	 * @return
	 */
	public Petition checkPetition(int petitionNo) {
		return sqlSession.selectOne("myPetitionsMapper.checkPetition", petitionNo);
	}
	
	/** 청원 승리
	 * @param petitionNo
	 * @return
	 */
	public int petitonVictory(int petitionNo) {
		return sqlSession.update("myPetitionsMapper.petitonVictory", petitionNo);
	}

	/** 청원 승리 취소
	 * @param petitionNo
	 * @return
	 */
	public int petitonVictoryCancel(int petitionNo) {
		return sqlSession.update("myPetitionsMapper.petitonVictoryCancel", petitionNo);
	}

	/** 청원 카테고리 조회
	 * @param petitionNo
	 * @return
	 */
	public List<PetitionCategory> selectCatagory(int petitionNo) {
		return sqlSession.selectList("myPetitionsMapper.selectCatagory", petitionNo);
	}


	/** 제목 수정
	 * @param update
	 * @return
	 */
	public int updateTitle(Petition update) {
		return sqlSession.update("myPetitionsMapper.updateTitle", update);
	}
	/** 내용 수정
	 * @param update
	 * @return
	 */
	public int updateContent(Petition update) {
		return sqlSession.update("myPetitionsMapper.updateContent", update);
	}
	/** 이미지 수정
	 * @param update
	 * @return
	 */
	public int updateImage(Petition update) {
		return sqlSession.update("myPetitionsMapper.updateImage", update);
	}

	
	/** 카테고리 추가
	 * @param category
	 * @return 
	 */
	public int insertCategory(String s) {
		return sqlSession.insert("myPetitionsMapper.insertCategory", s);
		
	}
	
	
	
	
}
