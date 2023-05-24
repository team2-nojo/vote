package edu.nojo.vote.myPetitions.model.service;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import edu.nojo.vote.myPetitions.model.dao.EmailDAO;


@Service
public class EmailServiceImpl implements EmailService {
	
	@Autowired
    private EmailDAO dao;
    
    @Autowired
    private JavaMailSender mailSender;
    
    private String fromEmail = "semiprojectnojo@gmail.com";
    private String fromUsername = "vote";
	
    @Transactional
    @Override
    public int update(@RequestParam(value="petitionNo", required=false) int petitionNo) {
        
        try {
            //메일 보내기
            MimeMessage mail = mailSender.createMimeMessage();
            
            // 제목
            String subject = "[vote]"+title+" 인증코드";
            
            // 문자 인코딩
            String charset = "UTF-8";
            
            // 메일 내용 (HTML형식. img 경로를 넣으면 사진도 보임)
            String mailContent 
                = "<p>Board Project "+title+" 인증코드입니다.</p>"
                + "<h3 style='color:blue'>" + authKey + "</h3>";
            
            
            
            // 송신자(보내는 사람) 지정
            mail.setFrom(new InternetAddress(fromEmail, fromUsername));
            mail.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            
            // 수신자(받는사람) 지정
            
            // 이메일 제목 세팅
            mail.setSubject(subject, charset);
            
            // 내용 세팅
            mail.setText(mailContent, charset, "html"); //"html" 추가 시 HTML 태그가 해석됨
            
            mailSender.send(mail);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
        
        Map<String, String> map = new HashMap<String, String>();
        map.put("authKey", authKey);
        map.put("email", email);
        
        System.out.println(map);
        
        int result = dao.updateAuthKey(map);
        
        if(result == 0) {
        	result = dao.insertAuthKey(map);
        }
        

        return result;
    }

}
