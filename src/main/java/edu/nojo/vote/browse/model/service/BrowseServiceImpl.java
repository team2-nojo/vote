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

}
