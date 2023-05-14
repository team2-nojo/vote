package edu.nojo.vote.writePetition.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nojo.vote.writePetition.model.dto.PetitionCategory;

@Repository
public class WritePetitionDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	public List<PetitionCategory> selectPetitionCategoryList() {
		return sql.selectList("writePetitionMapper.selectPetitionCategoryList");
	}
}
