package edu.nojo.vote.search.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nojo.vote.main.model.dto.Petition;

@Repository
public class SearchDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 실시간 검색
	 * @param query
	 * @return
	 */
	public List<Map<String, Object>> allSearch(String query) {
		return sqlSession.selectList("searchMapper.allSearch", query);
	}

	/** 검색결과
	 * @param query
	 * @return
	 */
	public List<Petition> searchResult(String query) {
		return sqlSession.selectList("searchMapper.searchResult", query);
	}
	
}
