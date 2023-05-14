package edu.nojo.vote.writePetition.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
