package edu.nojo.vote.myPetitions.model.service;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import edu.nojo.vote.common.utility.Util;
import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.dao.MyPetitionsDashboardDAO;
import edu.nojo.vote.myPetitions.model.dto.Comment;
import edu.nojo.vote.myPetitions.model.dto.Like;
import edu.nojo.vote.user.model.dto.User;
import edu.nojo.vote.writePetition.model.dao.WritePetitionDAO;
import edu.nojo.vote.writePetition.model.dto.PetitionCategory;

@Service
public class MyPetitionsDashboardServiceImpl implements MyPetitionsDashboardService{
	
	@Autowired
    private JavaMailSender mailSender;
	
	@Autowired
	private MyPetitionsDashboardDAO dao;
	
	@Autowired
	WritePetitionDAO dao2;
	
	// 청원 조회 서비스
	@Override
	public Petition selectMyPetition(Map<String, Object> map) {
		return dao.selectMyPetition(map);
	}

	// 청원 좋아요 누른 회원 리스트 조회 서비스
	@Override
	public List<Like> selectlikeUserList(int petitionNo) {
		return dao.selectlikeUserList(petitionNo);
	}
	
	// 청원 좋아요 누른 회원 리스트 최신화
	@Override
	public List<Like> resetlikeUserList(int petitionNo) {
		return dao.resetlikeUserList(petitionNo);
	}
	
	// 댓글 목록 조회
	@Override
	public List<Comment> resetcommentList(int petitionNo) {
		return dao.resetcommentList(petitionNo);
	}
	
	// 카테고리 유무 체크
	@Override
	public List<PetitionCategory> catagoryCheck(int petitionNo) {
		return dao.catagoryCheck(petitionNo);
	}
	
	// 청원 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int petitonDelete(int petitionNo) {
		return dao.petitonDelete(petitionNo);
	}
	
	// 청원 승리
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int petitonVictory(int petitionNo) {

		Petition petition = dao.checkPetition(petitionNo);
		
		int result = 0;
		
		if(petition.getPetitionVictory().equals("N")) {
			if(dao.petitonVictory(petitionNo) > 0) {
				result = 1; // 청원 승리
			}
		}else {
			if(dao.petitonVictoryCancel(petitionNo) > 0) {
				result = 2; // 청원 승리 취소
			}
		}
		return result;
	}
	
	// 청원 카테고리 조회
	@Override
	public List<PetitionCategory> selectCatagory(int petitionNo) {
		return dao.selectCatagory(petitionNo);
	}
	
	// 청원 수정
	@Override
	public int myPetitionUpdate(Petition petition, MultipartFile thumbnailImage, String webPath, String filePath,
			List<String> categoryList) throws IllegalStateException, IOException {

		int result = 0;
		
		// 제목
		petition.setPetitionTitle(Util.XSSHandling(petition.getPetitionTitle()));
		result += dao.updateTitle(petition);
		
		// 내용
		result += dao.updateContent(petition);
		
		// 썸네일
		if(thumbnailImage.getSize()>0) {
			String rename = Util.fileRename(thumbnailImage.getOriginalFilename());
			petition.setPetitionImage(webPath+rename);
			thumbnailImage.transferTo(new File(filePath+rename));
			result += dao.updateImage(petition);
		}
		
		// 카테고리 삭제
		
		 result =  dao.deleteCatagory(petition.getPetitionNo());
		
		 
		 List<String> categoryListTrim = new ArrayList<String>(); 
		 for(String s : categoryList) {
			 String st = s.trim();
			 categoryListTrim.add(st);
		 }
		 
		 
		 List<Map> cat = new ArrayList<>();
		 
		 for(String s : categoryListTrim) {
			 String st = s.trim();
			 
			 String stt = "";
			 for(int i = 0; i < st.length(); i++) {
				 if(st.charAt(i) != ' ')
					 stt += st.charAt(i);
			 };
			 
			 stt.replaceAll(" ",  "");
			 stt.replaceAll("\\s", "");
			 stt.replaceAll("[^\\p{Alnum}\\p{IsHangul}]", "");
			 
			 String categoryNo = dao.findCategory(stt);
			 if(categoryNo == null) {
					result = dao2.insertCategoryList(stt);
					categoryNo = dao2.selectCategory(stt);
				}
			 Map<String, Integer> category = new HashMap<String, Integer>();
			 category.put("petitionNo", petition.getPetitionNo());
			 category.put("categoryNo", Integer.parseInt(categoryNo));
			 cat.add(category);
		 }
		 System.out.println(cat);
		 // 카테고리 추가
		 for(Map catMap : cat) {
			 System.out.println(catMap);
			 dao.insertCategory(catMap);
		 }
		 
		return result;
	}
	
	// 이메일로 목록 보내기
	@Override
    public int exportList(Map<String, Object> data) {

        Object exportOptObj = data.get("exportOpt");
        Object petitionNoObj = data.get("petitionNo");
        String loginUserEmail = (String) data.get("loginUserEmail");
        
        
        int exportOpt = 0;
        if (exportOptObj instanceof Integer) {
            exportOpt = (Integer) exportOptObj;
        } else if (exportOptObj instanceof String) {
            exportOpt = Integer.parseInt((String) exportOptObj);
        }

        int petitionNo = 0;
        if (petitionNoObj instanceof Integer) {
            petitionNo = (Integer) petitionNoObj;
        } else if (petitionNoObj instanceof String) {
            petitionNo = Integer.parseInt((String) petitionNoObj);
        }
        
        try {            
        	String filePrefix = "output";
            String fileExtension = ".txt";

            // 현재 시간을 기준으로 파일 이름 생성
            LocalDateTime currentTime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
            String timestamp = currentTime.format(formatter);
            String fileName = filePrefix + "_" + timestamp + fileExtension;
        	
            String filePath = "C:/semi/vote/src/main/webapp/resources/list/" + fileName; 
            
            // 댓글 또는 지지자 목록을 불러와 텍스트 파일 생성
            FileWriter writer = new FileWriter(filePath);
            
            if(exportOpt == 1) {
                 List<Like> exportList = dao.selectlikeUserList(petitionNo);
                for(Like list : exportList) {
                    String text = "지지자 : " + list.getUserNickname() + ", 작성일 : " + list.getPetitionLikeDate();
                    writer.write(text + "\n");
                }
            }else {
                List<Comment> exportList = dao.resetcommentList(petitionNo);
                for(Comment list : exportList) {
                    String text = "지지자 : " + list.getUserNickname() + ", 댓글내용 : " + list.getCommentContent();
                    writer.write(text + "\n");
                }
            }
           
            writer.close();
            
            
            // 이메일 보내기
            
            String fromEmail = "semiprojectnojo@gmail.com";
            String fromUsername = "VOTE.kh";
            String email = loginUserEmail; // 로그인한 유저 아이디로 변경 
            
            // 이메일 보내기
            MimeMessage mail = mailSender.createMimeMessage();
            String subject = "vote사이트 입니다. 메일을 확인해주세요.";
            String charset = "UTF-8";
    
            // 메일 내용
            String mailContent = "당신의 청원을 지지하는 사람들에 대한 목록입니다.";
    
            // 송신자(보내는 사람) 지정
            mail.setFrom(new InternetAddress(fromEmail, fromUsername));
    
            // 수신자(받는사람) 지정
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(email, "UTF-8"));

            // 이메일 제목 세팅
            mail.setSubject(subject, charset);
    
            // 내용 세팅
            mail.setText(mailContent, charset, "html"); // "html" 추가 시 HTML 태그가 해석됨
    
            // 지정된 경로에 있는 파일을 첨부파일로 세팅
            MimeBodyPart attachmentBodyPart = new MimeBodyPart();
            DataSource source = new FileDataSource(filePath); // 첨부할 파일의 경로를 설정하세요.
            attachmentBodyPart.setDataHandler(new DataHandler(source));
            attachmentBodyPart.setFileName(fileName);
            
            Multipart multipart = new MimeMultipart();
            multipart.addBodyPart(attachmentBodyPart);
            mail.setContent(multipart);
            
            mailSender.send(mail);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }

        
        
        return 1;
    }
	
	// 청원조회
	@Override
	public Petition findPetition(String pno) {
		return dao.findPetition(pno);
	}
	
	// 회원조회
	@Override
	public User findUser(String uno) {
		return dao.findUser(uno);
	}
	
	
}
