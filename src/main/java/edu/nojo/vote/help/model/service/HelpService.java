package edu.nojo.vote.help.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

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
}
