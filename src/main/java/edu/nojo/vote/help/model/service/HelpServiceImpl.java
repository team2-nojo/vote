package edu.nojo.vote.help.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nojo.vote.administrator.model.dto.Pagination;
import edu.nojo.vote.help.model.dao.HelpDAO;
import edu.nojo.vote.help.model.dto.QNA3;

@Service
public class HelpServiceImpl implements HelpService{
	
	@Autowired
	private HelpDAO dao;

	@Override
	public Map<String, Object> QA3(int cp) {
		
		int QA3 = dao.QA3();
		
		Pagination pagination = new Pagination(QA3, cp);
		
		List<QNA3> QNA3List = dao.QNA3(pagination);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("QNA3List", QNA3List);
		
		return map;
	}
	
	

}
