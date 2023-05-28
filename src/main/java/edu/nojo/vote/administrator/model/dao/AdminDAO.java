package edu.nojo.vote.administrator.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.nojo.vote.administrator.model.dto.Pagination;
import edu.nojo.vote.administrator.model.dto.Pagination2;
import edu.nojo.vote.help.model.dto.QNA3;
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

	public int updateMainPetition(int selectedNumber, int petitionNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("selectedNumber", selectedNumber);
		map.put("petitionNo", petitionNo);
		return sqlSession.update("adminMapper.updateMainPetition", map);
			
	}

	public List<QNA3> QNA3(Pagination pagination, Map<String, Object> paramMap) {
		
		int offset = (pagination.getCurrentPage() - 1) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("HelpMapper.QNA3", paramMap, rowBounds);
	}

	
	
	/** 청원 상세 조회
	 * @paramp petitionNo
	 * @return petition
	 * */
	public Petition selectPetition(int petitionNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectPetition", petitionNo);
	}

	/**청원 수 조회(검색 햇을 때)
	 * @param paramMap
	 * @return listCount
	 **/
	public int getListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("adminMapper.getListCount_search", paramMap);
	}

	/**청원 목록 조회(검색)
	 * @param pagination
	 * @param paramMap
	 * @return petitionList
	 * 
	 * */
	public List<Petition> selectPetitionList(Pagination pagination, Map<String, Object> paramMap) {
		
		int offset = (pagination.getCurrentPage() - 1 ) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("adminMapper.selectPetitionList_search", paramMap, rowBounds);
	}


	/** 삭제되지 않은 유저 조회
	 * @return listCount
	 * */
	public int getUserListCount() {
		return sqlSession.selectOne("adminMapper.getUserListCount");
	}

	/**유저 조회에서 현재 페이지에 해당하는 부분에 대한 유저 목록 조회
	 * @param pagination
	 * @return
	 * 
	 * */
	public List<Petition> selectUserList(Pagination pagination) {

		int offset = (pagination.getCurrentPage() - 1 ) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("adminMapper.selectUserList", null, rowBounds);
	}

	
	
	
	/**유저 삭제 
	 * @param userNo
	 * @return sqlSession.update("adminMapper.deleteUser", userNo);
	 */
	public int deleteUser(int userNo) {
		return sqlSession.update("adminMapper.deleteUser", userNo);
	}

	
	/**청원 삭제
	 * @param petitionNo
	 * @return sqlSession.update("adminMapper.deletePetition", petitionNo);
	 */
	public int deletePetition(int petitionNo) {
		return sqlSession.update("adminMapper.deletePetition", petitionNo);
	}



	/** 삭제한 청원 수 조회
	 * @return
	 */
	public int getPetitionDelCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.getPetitionDelCount");
	}

	
	
	/** 삭제된 청원 조회
	 * @param pagination
	 * @return
	 */
	public List<Petition> selectPetitionDelList(Pagination pagination) {
		int offset = (pagination.getCurrentPage() - 1 ) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("adminMapper.selectPetitionDelList", null, rowBounds);
	}

	/** 삭제된 청원 복구
	 * @param petitionNo
	 * @return
	 */
	public int updateDelPetition(int petitionNo) {
		return sqlSession.update("adminMapper.updateDelPetition", petitionNo);
	}

	
	
	/** 삭제된!!! 유저 수 조회
	 * @return listCount
	 * */
	public int getDelUserListCount() {
		return sqlSession.selectOne("adminMapper.getDelUserListCount");
	}

	
	

	/** 삭제된! 유저 조회
	 * @param pagination2
	 * @return
	 */
	public List<Petition> selectDelUserList(Pagination2 pagination2) {
		int offset = (pagination2.getCurrentPage() - 1 ) * pagination2.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination2.getLimit());
		return sqlSession.selectList("adminMapper.selectDelUserList", null, rowBounds);
	}

	/** 삭제된 유저 복구 버튼
	 * @param userNo2
	 * @return
	 */
	public int updateDeleteUser(int userNo) {
		return sqlSession.update("adminMapper.updateDeleteUser", userNo);
	}


	
	




}
