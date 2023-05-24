package edu.nojo.vote.browse.model.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nojo.vote.browse.model.dao.BrowseDAO;
import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dto.PetitionUpdate;

@Service
public class BrowseServiceImpl implements BrowseService {
	
	@Autowired
	private BrowseDAO dao;
	
	// 인기순으로 조회
	@Override
	public List<Petition> popular() {
		List<Petition> petitionList = dao.popular(); 
		for(Petition p: petitionList) {
			if(p.getPetitionContent()!=null)
				p.setPetitionContent(p.getPetitionContent().replaceAll("<[^>]*>", ""));
		}
		return petitionList;
	}
	
	// 최신순으로 조회
	@Override
	public List<Petition> recent(int page) {
		List<Petition> petitionList = dao.recent(page); 
		for(Petition p: petitionList) {
			if(p.getPetitionContent()!=null)
				p.setPetitionContent(p.getPetitionContent().replaceAll("<[^>]*>", ""));
		}
		return petitionList;
	}
	
	// 승리한 청원 조회(최신순)
	@Override
	public List<Petition> victories() {
		List<Petition> petitionList = dao.victories();
		for(Petition p: petitionList) {
			if(p.getPetitionContent()!=null)
				p.setPetitionContent(p.getPetitionContent().replaceAll("<[^>]*>", ""));
		}
		return petitionList;
	}
	
	
	// 청원 상세조회
	@Override
	public Petition selectPetitionList(int petitionNo) {
		return dao.selectPetitionList(petitionNo);
	}
	
	// 청원 업데이트 리스트 조회
	@Override
	public List<PetitionUpdate> updatePetitionList(int petitionNo) {
		List<PetitionUpdate> updatePetitionList = dao.updatePetitionList(petitionNo);
		for(PetitionUpdate p : updatePetitionList) {
			if(p.getPetitionUpdateContent() != null) 
				p.setPetitionUpdateContent(p.getPetitionUpdateContent().replace("<[^>]*>", ""));
		}
		return updatePetitionList;
	}
	
	
}
