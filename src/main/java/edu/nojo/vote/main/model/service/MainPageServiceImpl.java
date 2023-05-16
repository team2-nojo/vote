package edu.nojo.vote.main.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nojo.vote.main.model.dao.MainPageDAO;

@Service
public class MainPageServiceImpl implements MainPageService {

	@Autowired
	private MainPageDAO dao;

	
	// 메인페이지 박스에 청원 보이기
	@Override
	public List<Map<String, Object>> selectMainPtList() {
		
		return dao.selectMainPtList();
	}


	@Override
	public List<Map<String, Object>> selectMainUserList() {
		// TODO Auto-generated method stub
		return dao.selectMainUserList();
	}
	
	
}
