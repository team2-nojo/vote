package edu.nojo.vote.browse.model.service;

import java.util.List;

import edu.nojo.vote.browse.model.dto.Browse;

public interface CommentService {

	/** 댓글 조회
	 * @param petitionNo
	 * @return list
	 */
	List<Browse> selectComments(int petitionNo);

	
	
}
