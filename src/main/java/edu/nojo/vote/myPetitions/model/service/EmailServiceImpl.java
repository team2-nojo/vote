package edu.nojo.vote.myPetitions.model.service;

import java.util.List;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.nojo.vote.myPetitions.model.dto.Like;
import edu.nojo.vote.myPetitions.model.dto.PetitionUpdate;


@Service
public class EmailServiceImpl implements EmailService {
	
	@Autowired
    private JavaMailSender mailSender;
    
    private String fromEmail = "semiprojectnojo@gmail.com";
    private String fromUsername = "vote";
	
	
    @Transactional
	@Override
	public int sendEmail(PetitionUpdate update, List<Like> likeUserList) {
    	 try {
             //인증메일 보내기
             MimeMessage mail = mailSender.createMimeMessage();
             // 문자 인코딩
             String charset = "UTF-8";
             // 제목
             String subject = "[vote]"+update.getPetitionUpdateTitle();
             // 메일 내용
             String mailContent = update.getPetitionUpdateContent();
             // 송신자(보내는 사람) 지정
             mail.setFrom(new InternetAddress(fromEmail, fromUsername));
             
             // 수신자(받는사람) 지정
             InternetAddress[] likeUseradd = new InternetAddress[likeUserList.size()];
             for (int i=0; i<likeUserList.size();   i++) {
            	 likeUseradd[i] = new InternetAddress(likeUserList.get(i).getUserEmail());
             }
             
             mail.setRecipients(Message.RecipientType.BCC, likeUseradd);

             
             // 이메일 제목 세팅
             mail.setSubject(subject, charset);
             // 내용 세팅
             mail.setText(mailContent, charset, "html"); //"html" 추가 시 HTML 태그가 해석됨
             mailSender.send(mail);
             
         } catch (Exception e) {
             e.printStackTrace();
             return 0;
         }
    	 
         return 1;
     }


	


}
