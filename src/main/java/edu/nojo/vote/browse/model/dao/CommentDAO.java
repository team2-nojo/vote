package edu.nojo.vote.browse.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nojo.vote.browse.model.dto.Browse;

@Repository
public class CommentDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;



	/** 댓글 조회
	 * @param petitionNo
	 * @return list
	 */
	public List<Browse> selectComments(int petitionNo) {
		
		return sqlSession.selectList("browseMapper.selectComments", petitionNo);
	}
	
	
	
	
}
