package edu.nojo.vote.myPetitions.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dto.Like;
import edu.nojo.vote.myPetitions.model.dto.PetitionUpdate;
import edu.nojo.vote.myPetitions.model.service.MyPetitionsDashboardService;
import edu.nojo.vote.myPetitions.model.service.MyPetitionsService;
import edu.nojo.vote.user.model.dto.User;

@SessionAttributes({ "loginUser" })
@RequestMapping("/myPetitions")
@Controller
public class MyPetitionsController {

	@Autowired
	private MyPetitionsService service;

	@Autowired
	private MyPetitionsDashboardService dashboardService;

	// myPetitions 메인에서 내 청원 페이지로 이동
	@GetMapping("/myPetitions")
	public String myPetitions(@SessionAttribute User loginUser, Model model) {

		// 필요한 자원
		// 로그인멤버 : 로그인 한 멤버의 회원 번호, 회원 닉네임, 회원 주소
		// 청원 : 글 번호, 글 제목, 글 내용, 글 삭제여부 (로그인 멤버의 회원 번호로 청원 테이블에서 조회)
		// 청원 좋아요 : 청원 좋아요 개수 (로그인 멤버의 회원 번호를 받아 청원 좋아요한 글을 조회)
		// 청원 좋아요 글 : 글 번호, 글 제목, 글 내용, 글 삭제여부(청원 좋아요한 글의 번호를 받아 청원 좋아요한 글을 조회)

		// 로그인 한 유저의 회원 번호를 이용해 작성한 글 목록 조회
		List<Petition> petitionList = service.selectMyPetitions(loginUser.getUserNo());

		// 로그인 한 유저의 좋아요 한 글 목록 조회 
		List<Petition> likeList = service.selectLikePetition(loginUser.getUserNo());
			
		// 조회한 내가 작성한 글 목록을 화면으로 전달
		model.addAttribute("petitionList", petitionList);
		// 조회한 좋아요 한 글 목록을 화면으로 전달
		model.addAttribute("likeList", likeList);		

		
		return "/myPetitions/myPetitions";
	}

	// myPetitionDashboardUpdate로 이동
	@GetMapping("/myPetitionsDashboard/myPetitionDashboardUpdate/{petitionNo}")
	public String myPetitionsDashboard(@SessionAttribute User loginUser, Model model,
			@PathVariable("petitionNo") int petitionNo) {


		Map<String, Object> map = new HashMap<String, Object>();
		map.put("loginUserNo", loginUser.getUserNo());
		map.put("petitionNo", petitionNo);

		// 청원 조회 서비스 호출
		Petition myPetition = dashboardService.selectMyPetition(map);
		
		model.addAttribute("myPetition", myPetition);
		
		

		return "/myPetitions/myPetitionDashboardUpdate";
	}
	
	
	// 청원 업데이트 게시글 작성
	@PostMapping("/myPetitionsDashboard/myPetitionDashboardUpdate/insert/{petitionNo}")
	public String updateInsert(
			@SessionAttribute User loginUser
		   ,@PathVariable ("petitionNo") int petitionNo
		   ,@RequestParam(value="petitionUpdateTitle", required=false) String petitionUpdateTitle
		   ,@RequestParam(value="inputImage", required=false) MultipartFile inputImage
		   , @RequestParam(value="petitionUpdateContent", required=false)String petitionUpdateContent
		   ,HttpSession session
		   ,RedirectAttributes ra
		   ) throws IllegalStateException, IOException {
		
		String message = null;
		
		// 업데이트를 위해 필요한 것
		// 입력값 : 업데이트할 표제, 사진, 업데이트 정보(내용)
		// 필요한 정보 : 페티션 번호, 타이틀, 작성자 이름
		// 청원 업데이트 value값 : 업데이트 글번호, 업데이트 제목, 업데이트 작성일, 업데이트 이미지, 업데이트 삭제 여부, 글 번호
		
		// loginUser : 작성자 이름
		// pathVariable : 페티션 번호
		
		PetitionUpdate update = new PetitionUpdate();
		
		update.setPetitionNo(petitionNo);
		update.setPetitionUpdateTitle(petitionUpdateTitle);
		update.setPetitionUpdateContent(petitionUpdateContent);
		update.setUserNo(loginUser.getUserNo());
		
		System.out.println(update.getPetitionUpdateTitle());
		System.out.println(update.getPetitionUpdateContent());
		
		String webPath = "/resources/images/petitionUpdate/";
		String filePath = session.getServletContext().getRealPath(webPath);
		int result = service.updateInsert(update, inputImage, webPath, filePath);
		
        if(result <= 0) 
        {
	        message = "업데이트 업로드 실패";
	        ra.addFlashAttribute("message", message);
	        // 업데이트 작성 화면으로 다시 리다이렉트
	        return "/myPetitionsDashboard/myPetitionDashboardUpdate/{petitionNo}/insert";
        }
		
        // 내 페티션 화면으로 리다이렉트
		return "redirect:/myPetitions/myPetitionsDashboard/{petitionNo}";
		
	}
	
	// 게시글 장석
	/*
	 * @PostMapping(
	 * "/myPetitionsDashboard/myPetitionDashboardUpdate/{petitionNo}/insert") public
	 * String boardInsert(
	 * 
	 * @PathVariable("petitionNo") int petitionNo // Petition petition,
	 * // @RequestParam(value="images", required=false) List<MultipartFile> images,
	 * // (파일이 다 담김) // HttpSession session, // @SessionAttribute("loginMember")
	 * Member loginMember, // RedirectAttributes ra ) { // 파라미터 : 제목, 내용, 파일(0~5개
	 * 까지) // 파일 저장 경로 : HttpSession // 세션 : 로그인한 회원의 번호 // 리다이렉트 시 데이터 전달 :
	 * RedirectAttributes // 작성 성공 시 이동할 게시판 코드 : @PathVariable("boardCode")
	 * 
	 * 
	 * 
	 * List<MultipartFile> - 업로드된 이미지가 없어도 List에 요소로 MultipartFile 객체가 추가됨 - 단, 업로드된
	 * 이미지가 없는 MultipartFile 객체는 파일 크기(size)가 0 또는 파일명(getOriginalFileName())이 "" //
	 * * // // // // 1. 로그인 한 회원 번호를 얻어와 board에 세팅 //
	 * board.setMemberNo(loginMember.getMemberNo()); // // // 2. boardCode도 board에
	 * 세팅 // board.setBoardCode(boardCode); // // // 3. 업로드된 이미지가 서버에 실제로 저장되는 경로 +
	 * 웹에서 요청 시 이미지를 볼 수 있는 경로(웹 접근 경로) // String webPath =
	 * "/resources/images/board/"; // String filePath =
	 * session.getServletContext().getRealPath(webPath); //
	 * //session.getServletContext() : application scope (서버 단위의 객체) // // // 게시글 삽입
	 * 서비스 호출 후 삽입된 게시글 번호 반환 받기 // int boardNo = service.boardInsert(board, images,
	 * webPath, filePath); // // // 게시글 삽입 성공 시 방금 삽입한 게시글의 상세 조회 페이지로 리다이렉트 // //
	 * /board/{boardCode}/{boardNo} // // String message = null; String path =
	 * "redirect:"; // // if(boardNo > 0) { // 성공 시 // message = "게시글이 등록 되었습니다.";
	 * // path += "/board/" + boardCode + "/" + boardNo; // } else { // 실패 시 //
	 * message = "게시글 등록 실패."; // path += "insert" + boardCode; // } //
	 * ra.addFlashAttribute("message", message); // return path; }
	 */

//	// myPetitionDetails 상세페이지로 이동
//	@GetMapping("/myPetitionDetails")
//	public String myPetitionDetails() {
//		return "/myPetitions/myPetitionsDetails";
//	}

//	// myPetitionComments 페이지로 이동
//	@GetMapping("/myPetitionComments")
//	public String myPetitionComments() {
//		return "/myPetitions/myPetitionsEdit";
//	}

}
