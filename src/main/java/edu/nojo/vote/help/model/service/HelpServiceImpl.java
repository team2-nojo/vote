package edu.nojo.vote.help.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import edu.nojo.vote.administrator.model.dto.Pagination;
import edu.nojo.vote.common.utility.Util;
import edu.nojo.vote.help.model.dao.HelpDAO;
import edu.nojo.vote.help.model.dto.QNA3;


@Service
public class HelpServiceImpl implements HelpService{
	
	@Autowired
	private HelpDAO dao;

	@Override
	public Map<String, Object> QA3(Map<String, Object> paramMap, int cp) {
		
				
        int QA3 = dao.QA3(paramMap);
		
		Pagination pagination = new Pagination(QA3, cp);
		
	    List<QNA3> QNA3List = dao.QNA3(pagination, paramMap);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination", pagination);
		map.put("QNA3List", QNA3List);
		
		return map;
	}

	// 게시글 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int helpInsert(QNA3 qna3) {
	
		qna3.setQnaCont( Util.XSSHandling( qna3.getQnaCont() ) );
		qna3.setQnaTitle( Util.XSSHandling( qna3.getQnaTitle() ) );
		
		int qnaNo = dao.helpInsert(qna3);
		

		return qnaNo;
	}
	
	

}
