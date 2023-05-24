package edu.nojo.vote.search.model.service;

import java.util.List;
import java.util.Map;

import edu.nojo.vote.main.model.dto.Petition;

public interface SearchService {

	// 일치하는 검색(실시간)
	List<Map<String, Object>> allSearch(String query);

	// 검색결과 
	List<Petition> searchResult(String query);

}
