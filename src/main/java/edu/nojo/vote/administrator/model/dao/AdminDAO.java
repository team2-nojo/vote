package edu.nojo.vote.administrator.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nojo.vote.administrator.model.dto.Pagination;
import edu.nojo.vote.main.model.dto.Petition;

@Repository
public class AdminDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/** 삭제되지 않은 청원 글 조회
	 * @return listCount
	 * */
	public int getListCount() {
		return sqlSession.selectOne("adminMapper.getListCount");
	}

	/**청원 조회에서 현재 페이지에 해당하는 부분에 대한 청원 목록 조회
	 * @param pagination
	 * @return
	 * 
	 * */
	public List<Petition> selectPetitionList(Pagination pagination) {
		
		// RowBounds 객체
		// -마이바티스에서 페이징처리를 위해 제공하는 객체
		// -offset 만큼 건너 뛰고
		// 그 다음 지정된 행 개수(limit)만큼 조회
		
		// 1) offset 계산
		int offset = (pagination.getCurrentPage() - 1 ) * pagination.getLimit();
		
		// 2) Rowbounds 객체 생성
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		// 3) selectList("namespace.id", 파라미터, RowBounds)
		return sqlSession.selectList("adminMapper.selectPetitionList", null, rowBounds);
	}


}
