package edu.nojo.vote.browse.model.dao;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nojo.vote.browse.model.dto.Browse;

@Repository
public class PetitionDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;



	
	
}
