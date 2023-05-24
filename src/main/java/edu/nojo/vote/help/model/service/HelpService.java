package edu.nojo.vote.help.model.service;

import java.util.List;
import java.util.Map;

import edu.nojo.vote.help.model.dto.QNA3;

public interface HelpService {
	
	/** FAQ 목록
	 * @return
	 */
	List<Map<String, Object>> selectFaqTypeList();

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


	/** 문의글 삭제 서비스
	 * @param qnaNo
	 * @return result
	 */
	int qnaDelete(int qnaNo);

	
    /** FAQ와 글 조회
     * @param paramMap 
     * @param faqNo
     * @return 
     */
	Map<String, Object> FAQList(Map<String, Object> paramMap, int faqNo);



}
