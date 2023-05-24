package edu.nojo.vote.myPetitions.model.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.nojo.vote.common.utility.Util;
import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dao.MyPetitionsDashboardDAO;
import edu.nojo.vote.myPetitions.model.dto.Like;
import edu.nojo.vote.user.model.dao.UserDAO;
import edu.nojo.vote.user.model.dto.User;
import edu.nojo.vote.writePetition.model.dao.WritePetitionDAO;
import edu.nojo.vote.writePetition.model.dto.PetitionCategory;

@Service
public class MyPetitionsDashboardServiceImpl implements MyPetitionsDashboardService{
	
	@Autowired
	private MyPetitionsDashboardDAO dao;
	
	
	// 청원 조회 서비스
	@Override
	public Petition selectMyPetition(Map<String, Object> map) {
		return dao.selectMyPetition(map);
	}

	// 청원 좋아요 누른 회원 리스트 조회 서비스
	@Override
	public List<Like> selectlikeUserList(int petitionNo) {
		return dao.selectlikeUserList(petitionNo);
	}
	
	// 청원 좋아요 누른 회원 리스트 최신화
	@Override
	public List<Like> resetlikeUserList(int petitionNo) {
		return dao.resetlikeUserList(petitionNo);
	}
	
	// 댓글 목록 조회
	@Override
	public List<Like> resetcommentList(int petitionNo) {
		return dao.resetcommentList(petitionNo);
	}
	
	// 카테고리 유무 체크
	@Override
	public List<PetitionCategory> catagoryCheck(int petitionNo) {
		return dao.catagoryCheck(petitionNo);
	}
	
	// 청원 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int petitonDelete(int petitionNo) {
		return dao.petitonDelete(petitionNo);
	}
	
	// 청원 승리
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int petitonVictory(int petitionNo) {

		Petition petition = dao.checkPetition(petitionNo);
		
		int result = 0;
		
		if(petition.getPetitionVictory().equals("N")) {
			if(dao.petitonVictory(petitionNo) > 0) {
				result = 1; // 청원 승리
			}
		}else {
			if(dao.petitonVictoryCancel(petitionNo) > 0) {
				result = 2; // 청원 승리 취소
			}
		}
		return result;
	}
	
	// 청원 카테고리 조회
	@Override
	public List<PetitionCategory> selectCatagory(int petitionNo) {
		return dao.selectCatagory(petitionNo);
	}
	
	@Override
	public int myPetitionUpdate(Map<String, Object> map, Petition petition, MultipartFile thumbnailImage,
			String webPath, String filePath, List<String> categoryList) throws IllegalStateException, IOException {

		// 기존 글 불러오기
		Petition pt = dao.selectMyPetition(map);
		
		// 비교하면서 틀린거만 업데이트 하기
		int result = 0;
		Petition update = new Petition();
		
		int petitionNo = Integer.parseInt((String) map.get("petitionNo"));
		update.setPetitionNo(petitionNo);
		// 제목
		if(!pt.getPetitionTitle().equals(petition.getPetitionTitle())) {
			update.setPetitionTitle(Util.XSSHandling(petition.getPetitionTitle()));
			result += dao.updateTitle(update);
		}
		// 내용
		if(!pt.getPetitionContent().equals(petition.getPetitionContent())) {
			update.setPetitionContent(petition.getPetitionContent());
			result += dao.updateContent(update);
		}
		// 썸네일이 null이 아니면 주소 생성
		if(thumbnailImage.getSize()>0) {
			String rename = Util.fileRename(thumbnailImage.getOriginalFilename());
			petition.setPetitionImage(webPath+rename);
			thumbnailImage.transferTo(new File(filePath+rename));
		}
		if(!pt.getPetitionImage().equals(petition.getPetitionImage())) {
			update.setPetitionImage(petition.getPetitionImage());
			result += dao.updateImage(update);
		}
	
	
	return result;
}
	
}
