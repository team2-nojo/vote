package edu.nojo.vote.administrator.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nojo.vote.administrator.model.dao.AdminDAO;
import edu.nojo.vote.administrator.model.dto.Pagination;
import edu.nojo.vote.main.model.dto.Petition;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO dao;
	
	
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




	







	
	
	
}
	
