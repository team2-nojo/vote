package edu.nojo.vote.main.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import edu.nojo.vote.main.model.dto.Petition;


public interface MainPageService {

	List<Petition> selectMainPtList();

	
	List<Petition> selectPetition();







	
	

}
