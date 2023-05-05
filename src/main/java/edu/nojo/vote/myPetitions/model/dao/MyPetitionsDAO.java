package edu.nojo.vote.myPetitions.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPetitionsDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
}
