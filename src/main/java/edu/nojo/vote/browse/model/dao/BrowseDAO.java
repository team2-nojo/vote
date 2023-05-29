package edu.nojo.vote.browse.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dto.Comment;
import edu.nojo.vote.myPetitions.model.dto.PetitionUpdate;
import edu.nojo.vote.writePetition.model.dto.PetitionCategory;

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
	 * @param comment
	 * @return count
	 */
	public int petitionLike(Comment comment) {
		
		return sqlSession.insert("browseMapper.petitionLike", comment);
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


	public int selectCategoryCount(int categoryNo) {
		return sqlSession.selectOne("browseMapper.selectCategoryCount",categoryNo);
	}


	public String selectCategoryName(int categoryNo) {
		return sqlSession.selectOne("browseMapper.selectCategoryName",categoryNo);
	}


	public List<Petition> selectPetitionList(int categoryNo, int page, String order) {
		return sqlSession.selectList("browseMapper.selectPetitionList"+order,categoryNo,new RowBounds(page*5,5));
	}
	
	public List<PetitionCategory> selectCategoryList(int petitionNo){
		return sqlSession.selectList("mainPageMapper.selectCategoryList",petitionNo);
	}

	
	
	/** 댓글유무확인
	 * @param comment
	 * @return
	 */
	public int commentSelect(Comment comment) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("browseMapper.commentSelect",comment);
	}
}
