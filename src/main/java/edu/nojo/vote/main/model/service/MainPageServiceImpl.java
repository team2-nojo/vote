package edu.nojo.vote.main.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nojo.vote.administrator.model.dto.Pagination;
import edu.nojo.vote.main.model.dao.MainPageDAO;
import edu.nojo.vote.main.model.dto.Petition;

@Service
public class MainPageServiceImpl implements MainPageService {

	@Autowired
	private MainPageDAO dao;

	
	// 메인페이지 박스에 청원 보이기
	@Override
	public List<Petition> selectMainPtList() {
//		List<Integer> mainPtNoList = dao.selectMainPtNoList();
//		List<Petition> result = new ArrayList<>();
//		for(int mainPtNo : mainPtNoList) {
//			Petition petition = dao.selectPetition(mainPtNo);
//			petition.setCategoryList(dao.selectCategoryList(mainPtNo));
//			
//			result.add(petition);
//		}
		return dao.selectMainPtList();
	}
}
