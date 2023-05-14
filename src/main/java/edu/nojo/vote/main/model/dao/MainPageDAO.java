package edu.nojo.vote.main.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainPageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/** 메인 페이지 박스 청원 보이기
	 * @return mainPagePtList
	 * */
	
	public List<Map<String, Object>> selectMainPtList() {
		
		return sqlSession.selectList("mainPageMapper.selectMainPtList");
	}
}
