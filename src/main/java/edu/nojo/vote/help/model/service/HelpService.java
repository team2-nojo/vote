package edu.nojo.vote.help.model.service;

import java.util.Map;

import edu.nojo.vote.help.model.dto.QNA3;

public interface HelpService {

	/** 문의 내역 조회
	 * @param paramMap 
	 * @param cp
	 * @return
	 */
	Map<String, Object> QA3(Map<String, Object> paramMap, int cp);

	/** 게시글 삽입 서비스
	 * @param qna3
	 * @return qnaNo
	 */
	int helpInsert(QNA3 qna3);

	/** 게시글 상세 조회
	 * @param map
	 * @return
	 */
	QNA3 selectqna(Map<String, Object> map) ;

	/** 게시글 수정
	 * @param qna3
	 * @return
	 */
	int qnaUpdate(QNA3 qna3);


}
