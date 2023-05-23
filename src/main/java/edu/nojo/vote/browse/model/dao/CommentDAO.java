package edu.nojo.vote.browse.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nojo.vote.browse.model.dto.Browse;
import edu.nojo.vote.myPetitions.model.dto.Comment;
import edu.nojo.vote.myPetitions.model.dto.Like;

@Repository
public class CommentDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;



	/** 댓글 조회(comments페이지)
	 * @param petitionNo
	 * @return list
	 */
	public List<Browse> selectComments(int petitionNo) {
		
		return sqlSession.selectList("myPetitionsMapper.resetcommentList", petitionNo);
	}



	/** details내부 댓글조회
	 * @param pno
	 * @return list
	 */
	public List<Comment> resetcommentList(int pno) {
		
		return sqlSession.selectList("myPetitionsMapper.resetcommentList", pno);
	}



	/** 댓글 작성
	 * @param comment
	 * @return result
	 */
	public int insert(Comment comment) {
		return sqlSession.selectOne("browseMapper.insert", comment);
	}
	
	
	
	
}
