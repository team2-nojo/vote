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
import edu.nojo.vote.help.model.dto.faq;

@Service
public class HelpServiceImpl implements HelpService{
	
	@Autowired
	private HelpDAO dao;

	
	// 1:1문의내역 조회
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

	// 1:1문의 게시글 삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int helpInsert(QNA3 qna3) {
	
		qna3.setQnaCont( Util.XSSHandling( qna3.getQnaCont() ) );
		qna3.setQnaTitle( Util.XSSHandling( qna3.getQnaTitle() ) );
		
		int qnaNo = dao.helpInsert(qna3);
		

		return qnaNo;
	}

	// 1:1 문의 상세 조회
	@Override
	public QNA3 selectqna(Map<String, Object> map) {
		return dao.selectqna(map);
	}

	// 1:1 문의 게시글 수정
    @Transactional(rollbackFor = Exception.class)
	@Override
	public int qnaUpdate(QNA3 qna3) {
		
		qna3.setQnaTitle( Util.XSSHandling( qna3.getQnaTitle() ) );
		qna3.setQnaCont( Util.XSSHandling( qna3.getQnaCont() ) );
		
		int rowCount = dao.qnaUpdate(qna3);
    	
		return rowCount;
	}


    // FAQ 카테고리 불러오기
	@Override
	public List<Map<String, Object>> selectFaqTypeList() {
		return dao.selectFaqTypeList();
	}

	// 1:1 문의 게시글 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int qnaDelete(int qnaNo) {
		return dao.qnaDelete(qnaNo);
	}

	// FAQ 글 조회
	@Override
	public Map<String, Object> FAQList(Map<String, Object> paramMap, int cp) {
		
	    int listCount = dao.getListCount(paramMap);
	    
	    Pagination pagination = new Pagination(listCount, cp);
	    
	    List<faq> faqList = dao.selectfaq2List(pagination, paramMap);
	    
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("pagination", pagination);
		 map.put("faqList",faqList);
		
	    return map;
	}


	

}



	
	
