package edu.nojo.vote.browse.model.service;

import java.util.List;

import edu.nojo.vote.browse.model.dto.Browse;
import edu.nojo.vote.myPetitions.model.dto.Comment;

public interface CommentService {

	/** 댓글 조회(comments페이지)
	 * @param petitionNo
	 * @return list
	 */
	List<Browse> selectComments(int petitionNo);



	/** 댓글 작성
	 * @param comment
	 * @return result
	 */
	int insert(Comment comment);









	


	
	
}
