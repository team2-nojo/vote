package edu.nojo.vote.myPetitions.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nojo.vote.main.model.dto.Petition;

@Repository
public class MyPetitionsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Petition> selectMyPetitions(int userNo) {
		return sqlSession.selectList("myPetitionsMapper.selectMyPetitions", userNo);
	}
	
	
	
	
}
