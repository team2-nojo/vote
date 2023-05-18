package edu.nojo.vote.mypage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
