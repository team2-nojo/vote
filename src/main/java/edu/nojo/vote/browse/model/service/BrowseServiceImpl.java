package edu.nojo.vote.browse.model.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nojo.vote.browse.model.dao.BrowseDAO;
import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dto.PetitionUpdate;

@Service
public class BrowseServiceImpl implements BrowseService {
	
	@Autowired
	private BrowseDAO dao;
	
	@Override
	public List<Petition> loadPetitionList(int page, String order) {
		List<Petition> petitionList = dao.loadPetitionList(page, order);
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

	
	/**
	 *	청원 좋아요 확인
	 */
//	@Override
//	public int petitionLikeCheck(Map<String, Object> map) {
//		return dao.petitionLikeCheck(map);
//	}
	
	
	
	/**
	 * 청원 좋아요
	 */
	@Override
	public int petitionLike(Map<String, Integer> paramMap) {
		
		return dao.petitionLike(paramMap);
	}
	
	

	// 청원 업데이트 리스트 조회
	@Override
	public List<PetitionUpdate> updatePetitionList(int petitionNo) {
		List<PetitionUpdate> updatePetitionList = dao.updatePetitionList(petitionNo);
		for(PetitionUpdate p : updatePetitionList) {
			// 조회한 업데이트 내역 중, 썸머노트로 입력한 값에서 html 태그를 뺀 값 구하기
			if(p.getPetitionUpdateContent() != null) 
				p.setPetitionUpdateContent(p.getPetitionUpdateContent().replace("<[^>]*>", ""));
		}
		return updatePetitionList;
	}

}
