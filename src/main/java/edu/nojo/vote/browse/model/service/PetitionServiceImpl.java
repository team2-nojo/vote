package edu.nojo.vote.browse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nojo.vote.browse.model.dao.PetitionDAO;
import edu.nojo.vote.browse.model.dto.BrowsePetition;



@Service
public class PetitionServiceImpl implements PetitionService{

	@Autowired
	public PetitionDAO dao;
	
	
	// petition 목록 조회
	@Override
	public List<BrowsePetition> selectBrowsePtList() {
		return dao.selectBrowsePtList();
	}
}
