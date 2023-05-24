package edu.nojo.vote.myPetitions.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dto.PetitionUpdate;

public interface MyPetitionsService {

	/** 로그인 한 유저의 회원 번호를 이용해 작성한 글 조회
	 * @param userNo
	 * @return petitionList
	 */
	List<Petition> selectMyPetitions(int userNo);

	/** 로그인 한 유저의 좋아요 한 글을 조회 
	 * @param userNo
	 * @return likeList
	 */
	List<Petition> selectLikePetition(int userNo);

	/** 청원 업데이트 게시글 작성
	 * @param update
	 * @param inputImage
	 * @param webPath
	 * @param filePath
	 * @return result
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	int updateInsert(PetitionUpdate update, MultipartFile inputImage, String webPath, String filePath) throws IllegalStateException, IOException;



}
