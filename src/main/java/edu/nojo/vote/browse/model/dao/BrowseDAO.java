package edu.nojo.vote.browse.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dto.PetitionUpdate;

@Repository
public class BrowseDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 청원 상세조회
	 * @param petitionNo
	 * @return list
	 */
	public Petition selectPetitionList(int petitionNo) {
		return sqlSession.selectOne("browseMapper.selectPetitionList", petitionNo);
	}


	/** 청원 좋아요 확인
	 * @param map
	 * @return count
	 */
//	public int petitionLikeCheck(Map<String, Object> map) {
//		
//		return sqlSession.selectOne("browseMapper.petitionLikeCheck", map);
//	}
	
	

	/** 청원 좋아요 삽입
	 * @param paramMap
	 * @return count
	 */
	public int petitionLike(Map<String, Integer> paramMap) {
		
		return sqlSession.insert("browseMapper.petitionLike", paramMap);
  }

	/** 해당 청원에 있는 업데이트 목록 조회
	 * @param petitionNo
	 * @return
	 */
	public List<PetitionUpdate> updatePetitionList(int petitionNo) {
		return sqlSession.selectList("myPetitionsMapper.updatePetitionList", petitionNo);

	}

	public List<Petition> loadPetitionList(int page, String order) {
		return sqlSession.selectList("browseMapper."+order,null,new RowBounds(page*5, 5));
	}
	
	
	
	
}
