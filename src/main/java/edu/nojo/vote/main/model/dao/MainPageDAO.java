package edu.nojo.vote.main.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.writePetition.model.dto.PetitionCategory;

@Repository
public class MainPageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/** 메인 페이지 박스 청원 보이기
	 * @return mainPagePtList
	 * */
	
	public List<Petition> selectMainPtList() {
		return sqlSession.selectList("mainPageMapper.selectMainPtList");
	}


	public List<Map<String, Object>> selectMainUserList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mainPageMapper.selectMainUserList");
	}


	public List<Integer> selectMainPtNoList() {
		return sqlSession.selectList("mainPageMapper.selectMainPtNoList");
	}


//	public Petition selectPetition(int mainPtNo) {
//		return sqlSession.selectOne("mainPageMapper.selectPetition",mainPtNo);
//	}


	public List<PetitionCategory> selectCategoryList(int petitionNo) {
		return sqlSession.selectList("mainPageMapper.selectCategoryList",petitionNo);
	}

	public List<Petition> selectPetition(int page) {
		RowBounds rowBounds = new RowBounds(page*3,3);
		return sqlSession.selectList("mainPageMapper.selectPetition",null,rowBounds);
	}











}
