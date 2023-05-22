package edu.nojo.vote.browse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nojo.vote.browse.model.dao.BrowseDAO;
import edu.nojo.vote.main.model.dto.Petition;

@Service
public class BrowseServiceImpl implements BrowseService {
	
	@Autowired
	private BrowseDAO dao;
	
	// 인기순으로 조회
	@Override
	public List<Petition> popular() {
		return dao.popular();
	}
	
	// 최신순으로 조회
	@Override
	public List<Petition> recent() {
		return dao.recent();
	}
	
	// 승리한 청원 조회(최신순)
	@Override
	public List<Petition> victories() {
		return dao.victories();
	}
	
	
	// 청원 상세조회
	@Override
	public Petition selectPetitionList(int petitionNo) {
		return dao.selectPetitionList(petitionNo);
	}

}
