package edu.nojo.vote.writePetition.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.writePetition.model.dto.PetitionCategory;

public interface WritePetitionService {

	List<PetitionCategory> selectPetitionCategoryList();

	int writePetition(Petition petition, List<Integer> categoryItems, String directInput,
			List<String> directInputCategory, MultipartFile thumbnailImage, String webPath, String filePath) throws IllegalStateException, IOException, Exception;

}