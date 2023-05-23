package edu.nojo.vote.myPetitions.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dto.PetitionUpdate;

@Repository
public class MyPetitionsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	/** 로그인 한 멤버의 회원 번호를 이용해 작성한 글 조회
	 * @param userNo
	 * @return petitionList
	 */
	public List<Petition> selectMyPetitions(int userNo) {
		return sqlSession.selectList("myPetitionsMapper.selectMyPetitions", userNo);
	}


	/** 로그인 한 유저의 좋아요 한 글을 조회 
	 * @param userNo
	 * @return likeList
	 */
	public List<Petition> selectLikePetition(int userNo) {
		return sqlSession.selectList("myPetitionsMapper.selectLikePetitions", userNo);
	}


	/** 청원 업데이트 게시글 작성
	 * @param update
	 * @return result
	 */
	public int updateInsert(PetitionUpdate update) {
		return sqlSession.insert("myPetitionsMapper.updateInsert", update);
	}
	

	
	
	
}
