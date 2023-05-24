package edu.nojo.vote.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nojo.vote.main.model.dao.MainPageDAO;
import edu.nojo.vote.main.model.dto.Petition;

@Service
public class MainPageServiceImpl implements MainPageService {

	@Autowired
	private MainPageDAO dao;

	
	// 메인페이지 박스에 청원 보이기
	@Override
	public List<Petition> selectMainPtList() {
		List<Petition> petitionList = dao.selectMainPtList();
		for(Petition p: petitionList) {
			if(p.getPetitionContent()!=null)
				p.setPetitionContent(p.getPetitionContent().replaceAll("<[^>]*>", ""));
		}
		
		return petitionList;
	}


	@Override
	public List<Petition> selectPetition(int page) {
		List<Petition> petitionList = dao.selectPetition(page);
		for(Petition p: petitionList) {
			p.setCategoryList(dao.selectCategoryList(p.getPetitionNo()));
			if(p.getPetitionContent()!=null)
				p.setPetitionContent(p.getPetitionContent().replaceAll("<[^>]*>", ""));
		}
		return petitionList;
	}
}
