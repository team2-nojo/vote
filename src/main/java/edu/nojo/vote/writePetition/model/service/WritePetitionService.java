package edu.nojo.vote.writePetition.model.service;

import java.util.List;

import edu.nojo.vote.writePetition.model.dto.PetitionCategory;

public interface WritePetitionService {

	List<PetitionCategory> selectPetitionCategoryList();

}