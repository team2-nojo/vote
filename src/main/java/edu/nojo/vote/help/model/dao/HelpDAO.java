package edu.nojo.vote.help.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nojo.vote.administrator.model.dto.Pagination;
import edu.nojo.vote.help.model.dto.QNA3;

@Repository
public class HelpDAO {

	/** 문의 글 조회
	 */
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int QA3() {
		return sqlSession.selectOne("HelpMapper.QA3");
	}

	/** 현재 페이지에 해당하는 부분에 대한 문의 글 조회
	 * @param pagination
	 * @return
	 */
	public List<QNA3> QNA3(Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() - 1 ) * pagination.getLimit();
		
		// 2) Rowbounds 객체 생성
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("HelpMapper.QNA3", rowBounds);
	}

}
