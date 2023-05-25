package edu.nojo.vote.browse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nojo.vote.browse.model.dao.CommentDAO;
import edu.nojo.vote.browse.model.dto.Browse;
import edu.nojo.vote.common.utility.Util;
import edu.nojo.vote.myPetitions.model.dto.Comment;



@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	private CommentDAO dao;

	// 댓글 조회(comments페이지)
	@Override
	public List<Browse> selectComments(int petitionNo) {
//		System.out.println(dao.selectComments(petitionNo));
		return dao.selectComments(petitionNo);
	}
	
	
	
	
	
	// 댓글 작성
	@Override
	public int insert(Comment comment) {
		// XSS방지 처리
		comment.setCommentContent(Util.XSSHandling(comment.getCommentContent()));
		
//		System.out.println(comment);
		
		return dao.insert(comment);
	}
	
	

	
}
