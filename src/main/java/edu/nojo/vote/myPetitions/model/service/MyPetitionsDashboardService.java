package edu.nojo.vote.myPetitions.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dto.Comment;
import edu.nojo.vote.myPetitions.model.dto.Like;
import edu.nojo.vote.user.model.dto.User;
import edu.nojo.vote.writePetition.model.dto.PetitionCategory;

public interface MyPetitionsDashboardService {

	/** 청원 조회 서비스
	 * @param map
	 * @return
	 */
	Petition selectMyPetition(Map<String, Object> map);

	/** 청원 좋아요 누른 회원 리스트 조회 서비스
	 * @param petitionNo
	 * @return
	 */
	List<Like> selectlikeUserList(int petitionNo);

	/** 청원 좋아요 누른 회원 리스트 최신화
	 * @param pno
	 * @return
	 */
	List<Like> resetlikeUserList(int pno);

	/** 댓글 목록 조회
	 * @param pno
	 * @return
	 */
	List<Comment> resetcommentList(int pno);

	/** 카테고리 유무 체크
	 * @param petitionNo
	 * @return
	 */
	List<PetitionCategory> catagoryCheck(int petitionNo);

	/** 청원 삭제
	 * @param pno
	 * @return
	 */
	int petitonDelete(int pno);

	/** 청원 승리
	 * @param pno
	 * @return
	 */
	int petitonVictory(int pno);

	/** 청원 카테고리 조회
	 * @param petitionNo
	 * @return
	 */
	List<PetitionCategory> selectCatagory(int petitionNo);


	/** 청원 수정
	 * @param petition
	 * @param thumbnailImage
	 * @param webPath
	 * @param filePath
	 * @param categoryList
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	int myPetitionUpdate(Petition petition, MultipartFile thumbnailImage, String webPath, String filePath,
			List<String> categoryList) throws IllegalStateException, IOException;

	/** 이메일로 목록 보내기
	 * @param data
	 * @return
	 */
	int exportList(Map<String, Object> data);

	/** 청원조회
	 * @param pno
	 * @return
	 */
	Petition findPetition(String pno);

	/** 회원조회
	 * @param uno
	 * @return
	 */
	User findUser(String uno);


}
