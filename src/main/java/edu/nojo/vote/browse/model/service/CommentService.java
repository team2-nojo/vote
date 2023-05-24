package edu.nojo.vote.browse.model.service;

import java.util.List;

import edu.nojo.vote.browse.model.dto.Browse;
import edu.nojo.vote.myPetitions.model.dto.Comment;
import edu.nojo.vote.myPetitions.model.dto.Like;

public interface CommentService {

	/** 댓글 조회(comments페이지)
	 * @param petitionNo
	 * @return list
	 */
	List<Browse> selectComments(int petitionNo);

	/** details 내부 댓글 조회
	 * @param pno
	 * @return list
	 */
	List<Comment> resetcommentList(int pno);

	/** 댓글 작성
	 * @param comment
	 * @return result
	 */
	int insert(Comment comment);

	
	
}
