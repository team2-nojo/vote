package edu.nojo.vote.browse.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nojo.vote.main.model.dto.Petition;

@Repository
public class BrowseDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 인기순으로 조회
	public List<Petition> popular() {
		return sqlSession.selectList("browseMapper.popular");
	}

	// 최신순으로 조
	public List<Petition> recent() {
		return sqlSession.selectList("browseMapper.recent");
	}

	/** 승리한 청원 조회(최신순)
	 * @return victoriesList
	 */
	public List<Petition> victories() {
		return sqlSession.selectList("browseMapper.victories");
	}
	
}