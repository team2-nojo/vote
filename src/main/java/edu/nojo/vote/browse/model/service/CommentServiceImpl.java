package edu.nojo.vote.browse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nojo.vote.browse.model.dao.CommentDAO;
import edu.nojo.vote.browse.model.dto.Browse;


@Service
public class CommentServiceImpl implements CommentService{
	
	@Autowired
	private CommentDAO dao;

	// 댓글 조회
	@Override
	public List<Browse> selectComments(int petitionNo) {
		
		return dao.selectComments(petitionNo);
	}
	
	
}
