package edu.nojo.vote.writePetition.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.nojo.vote.common.utility.Util;
import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.writePetition.model.dao.WritePetitionDAO;
import edu.nojo.vote.writePetition.model.dto.PetitionCategory;

@Service
public class WritePetitionServiceImpl implements WritePetitionService{
	
	@Autowired
	WritePetitionDAO dao;

	@Override
	public List<PetitionCategory> selectPetitionCategoryList() {
		return dao.selectPetitionCategoryList();
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int writePetition(Petition petition, List<Integer> categoryItems, String directInput,
			List<String> directInputCategory, MultipartFile thumbnailImage, String webPath, String filePath) throws IllegalStateException, IOException, Exception{
		if(categoryItems == null) categoryItems = new ArrayList<>();
		petition.setPetitionTitle(Util.XSSHandling(petition.getPetitionTitle()));
		if(thumbnailImage.getSize()>0) {
			String rename = Util.fileRename(thumbnailImage.getOriginalFilename());
			petition.setPetitionImage(webPath+rename);
			thumbnailImage.transferTo(new File(filePath+rename));
		}
		
		int result = dao.insertPetition(petition);
		
		
		
		// 직접 입력이 선택된 경우
		if(directInput.equals("y") && directInputCategory!=null) {
			// 직접 입력한 카테고리 목록 순차 접근
			for(String categoryName : directInputCategory) {
				// 직접 입력한 카테고리명으로 categoryNo select
				String categoryNo = dao.selectCategory(categoryName);
				// 직접 입력한 카테고리가 카테고리 목록에 없다면 카테고리 추가
				if(categoryNo == null) {
					result = dao.insertCategoryList(categoryName);
					categoryNo = dao.selectCategory(categoryName);
				}
				// 카테고리 목록에 카테고리 넘버 추가
				categoryItems.add(Integer.parseInt(categoryNo));
			}
		}
		
		for(int i : categoryItems) {
			PetitionCategory category = new PetitionCategory();
			category.setBoardNo(petition.getPetitionNo());
			category.setCategoryNo(i);
			dao.insertCategory(category);
		}
		
		return result;
	}
}
