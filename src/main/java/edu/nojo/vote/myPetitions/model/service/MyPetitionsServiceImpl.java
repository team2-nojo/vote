package edu.nojo.vote.myPetitions.model.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.nojo.vote.common.utility.Util;
import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dao.MyPetitionsDAO;
import edu.nojo.vote.myPetitions.model.dto.PetitionUpdate;

@Service
public class MyPetitionsServiceImpl implements MyPetitionsService {
	
	@Autowired
	private MyPetitionsDAO dao;
	
	
	
	// 로그인 한 멤버의 회원 번호를 이용해 작성한 글 조회
	@Override
	public List<Petition> selectMyPetitions(int userNo) {
		List<Petition> petitionList = dao.selectMyPetitions(userNo);

		for(Petition p: petitionList) {
			if(p.getPetitionContent()!=null)
				p.setPetitionContent(p.getPetitionContent().replaceAll("<[^>]*>", ""));
				p.setPetitionTitle(p.getPetitionTitle().replaceAll("<[^>]*>", ""));
		}
		
		return petitionList;
	}


	// 로그인 한 유저의 좋아요 한 글을 조회 
	@Override
	public List<Petition> selectLikePetition(int userNo) {
		return dao.selectLikePetition(userNo);
	}

	
	// 청원 업데이트 게시글 작성
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateInsert(PetitionUpdate update, MultipartFile inputImage, String webPath, String filePath) throws IllegalStateException, IOException {
		// 이미지 rename, 이미지 주소 삽입
		if(inputImage.getSize()>0) {
			String rename = Util.fileRename(inputImage.getOriginalFilename());
			update.setPetitionUpdateImage(webPath + rename);
			inputImage.transferTo(new File(filePath+rename));
		}
		
		return dao.updateInsert(update);
	}
	
	
	

}
