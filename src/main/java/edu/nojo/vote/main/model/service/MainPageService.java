package edu.nojo.vote.main.model.service;

import java.util.List;
import java.util.Map;

import edu.nojo.vote.main.model.dto.Petition;


public interface MainPageService {

	List<Petition> selectMainPtList();

	
	List<Petition> selectPetition();

}
