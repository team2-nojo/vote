package edu.nojo.vote.myPetitions.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dao.MyPetitionsDAO;

@Service
public class MyPetitionsServiceImpl implements MyPetitionsService {
	
	@Autowired
	private MyPetitionsDAO dao;
	
	
	
	// 로그인 한 멤버의 회원 번호를 이용해 작성한 글 조회
	@Override
	public List<Petition> selectMyPetitions(int userNo) {
		return dao.selectMyPetitions(userNo);
	}

}
