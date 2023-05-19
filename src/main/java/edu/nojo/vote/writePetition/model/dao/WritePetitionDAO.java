package edu.nojo.vote.writePetition.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.writePetition.model.dto.PetitionCategory;

@Repository
public class WritePetitionDAO {
	
	@Autowired
	private SqlSessionTemplate sql;
	
	public List<PetitionCategory> selectPetitionCategoryList() {
		return sql.selectList("writePetitionMapper.selectPetitionCategoryList");
	}

	public String selectCategory(String categoryName) {
		return sql.selectOne("writePetitionMapper.selectCategoryList",categoryName);
	}

	public int insertCategoryList(String categoryName) {
		return sql.insert("writePetitionMapper.insertCategoryList",categoryName);
	}

	public int insertPetition(Petition petition) {
		return sql.insert("writePetitionMapper.insertPetition",petition);
	}

	public int insertCategory(PetitionCategory category) {
		return sql.insert("writePetitionMapper.insertCategory",category);
	}
}
