package edu.nojo.vote.myPetitions.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dao.MyPetitionsDashboardDAO;
import edu.nojo.vote.myPetitions.model.dto.Like;
import edu.nojo.vote.user.model.dao.UserDAO;
import edu.nojo.vote.user.model.dto.User;

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
	
	
}
