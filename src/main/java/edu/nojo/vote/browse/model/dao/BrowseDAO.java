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
		return sqlSession.selectList("browseMapper.selectList");
	}
	
}
