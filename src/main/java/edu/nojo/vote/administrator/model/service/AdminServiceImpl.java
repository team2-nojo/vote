package edu.nojo.vote.administrator.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.nojo.vote.administrator.model.dao.AdminDAO;
import edu.nojo.vote.administrator.model.dto.Pagination;
import edu.nojo.vote.help.model.dto.QNA3;
import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.user.model.dto.User;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	
	@Override
	public Map<String, Object> selectPetitionList(int cp) {
		
		
		int listCount = dao.getListCount();
		
		Pagination pagination = new Pagination(listCount, cp);
		
		List<Petition> petitionList = dao.selectPetitionList(pagination);
		
		// pagination, boardList를 Map에 담아서 반환
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("petitionList", petitionList);
		
		
		return map;
		
	}
	
	
	@Override
	public int updateMainPetition(int selectedNumber, int petitionNo) {
		// TODO Auto-generated method stub
		return dao.updateMainPetition(selectedNumber, petitionNo);
	}


	@Override
	public Map<String, Object> selectQnAList(Map<String, Object> paramMap, int cp) {

		int listCount = dao.getListCount();
		
		Pagination pagination = new Pagination(listCount, cp);
		
		List<QNA3> qNaList = dao.QNA3(pagination, paramMap);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("qNaList", qNaList);
		
		
		return map;
	}

	
	//청원 상세 조회
	@Override
	public Petition selectPetition(int petitionNo) {
		return dao.selectPetition(petitionNo);
	}

	

	







	
	
	
}
	
