package edu.nojo.vote.search.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.search.model.dao.SearchDAO;

@Service
public class SearchServiceImpl implements SearchService{
	
	@Autowired
	private SearchDAO dao;
	
	// 실시간 검색
	@Override
	public List<Map<String, Object>> allSearch(String query) {
		return dao.allSearch(query);
	}
	
	// 검색 결과
	@Override
	public List<Petition> searchResult(String query) {
		List<Petition> searchList = dao.searchResult(query); 
		for(Petition p: searchList) {
			if(p.getPetitionContent()!=null)
				p.setPetitionContent(p.getPetitionContent().replaceAll("<[^>]*>", ""));
		}
		return searchList;
	}
	
}
