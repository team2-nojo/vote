package edu.nojo.vote.browse.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nojo.vote.browse.model.dto.Browse;
import edu.nojo.vote.myPetitions.model.dto.Comment;

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





	/** 댓글 작성
	 * @param comment
	 * @return result
	 */
	public int insert(Comment comment) {
		return sqlSession.insert("browseMapper.insert", comment);
	}



	
	
	
	
}
