package edu.nojo.vote.myPetitions.model.service;

import java.util.List;

import edu.nojo.vote.myPetitions.model.dto.Like;
import edu.nojo.vote.myPetitions.model.dto.PetitionUpdate;

public interface EmailService {

	int sendEmail(PetitionUpdate update, List<Like> likeUserList);
	

	
    
}
