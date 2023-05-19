package edu.nojo.vote.myPetitions.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dto.Like;
import edu.nojo.vote.user.model.dto.User;

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
	
	
	
	
}
