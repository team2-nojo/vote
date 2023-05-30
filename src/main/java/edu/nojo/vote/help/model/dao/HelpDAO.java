package edu.nojo.vote.help.model.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import edu.nojo.vote.administrator.model.dto.Pagination;
import edu.nojo.vote.help.model.dto.QNA3;
import edu.nojo.vote.help.model.dto.faq;

// 임포트 구문

@Repository // 영속성 관련 클래스와 Bean 등록
public class HelpDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/** 1:1 문의 글 조회
	 * @param paramMap
	 * @return
	 */

	public int QA3(Map<String, Object> paramMap) {
		return sqlSession.selectOne("HelpMapper.QA3");
	}
	
	/** 현재 페이지에 해당하는 부분에 대한 1:1 문의 글 조회
	 * @param pagination
	 * @param paramMap 
	 * @return
	 */
	public List<QNA3> QNA3(Pagination pagination, Map<String, Object> paramMap) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("HelpMapper.QNA3", paramMap, rowBounds);
	}

	/** 1:1 문의 글 삽입
	 * @param qna3
	 * @return
	 */
	public int helpInsert(QNA3 qna3) {
	    int result = sqlSession.insert("HelpMapper.helpInsert", qna3);
	    
	    if(result > 0) result = qna3.getQnaNo();
	    
		return result;
	}

	/** 1:1 게시글 상세 조회
	 * @param map
	 * @return
	 */
	public QNA3 selectqna(Map<String, Object> map) {
		return sqlSession.selectOne("HelpMapper.selectqna", map);
	}

	/** 1:1 게시글 수정
	 * @param qna3
	 * @return
	 */
	public int qnaUpdate(QNA3 qna3) {
		return sqlSession.update("HelpMapper.helpUpdate", qna3);
	}

	/** FAQ 카테고리 목록 조회
	 * @param pagination
	 * @param paramMap
	 * @return
	 */
	public List<Map<String, Object>> selectFaqTypeList() {
		return sqlSession.selectList("HelpMapper.selectfaqTypeList");
	}
	

	/** 1:1문의글 삭제
	 * @param qnaNo
	 * @return
	 */
	public int qnaDelete(int qnaNo) {
		return sqlSession.update("HelpMapper.qnaDelete", qnaNo);
	}


	/** FAQ 게시글 수 조회
	 * @param paramMap
	 * @return
	 */
	public int getListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("HelpMapper.faqCount_search", paramMap);
	}

	/** FAQ 게시글 목록 조회
	 * @param pagination
	 * @param paramMap
	 * @return
	 */
	public List<faq> selectfaq2List(Pagination pagination, Map<String, Object> paramMap) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("HelpMapper.faq2List_search", paramMap, rowBounds);
	}

	}





