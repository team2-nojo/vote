package edu.nojo.vote.common.websocket;

import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.mail.Message;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import edu.nojo.vote.main.model.dto.Petition;
import edu.nojo.vote.myPetitions.model.service.MyPetitionsDashboardService;
import edu.nojo.vote.user.model.dto.User;

public class AlarmWebsocketHandler extends TextWebSocketHandler{
	
	
	@Autowired 
	private MyPetitionsDashboardService service;

	private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<>());

	// - 클라이언트와 연결이 완료되고, 통신할 준비가 되면 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		// 클라이언트 웹소켓 연결을 요청하면 sessions에 
		// 클라이언트와의 전이중통신을 담당하는 객체 WebSocketSession을 추가
		sessions.add(session); // 웹소켓 통신을 요청한 클라이언트들의 정보가 쌓임
	
	}

	
	// - 클라이언트로부터 메세지가 도착하면 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		// Payload : 통신 시 탑재된 데이터(메시지)
		
		System.out.println("전달 받은 내용 : " + message.getPayload());
		
		// testSock으로 연결된 객체를 만든 클라이언트들(sessions)에게 전달받은 내용을 보냄
		for(WebSocketSession s : sessions) {
			s.sendMessage(message);
		}
		
	}

	
	// - 클라이언트와 연결이 종료되면 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		// sessions에서 나간 클라이언트의 정보를 제거
		sessions.remove(session);
	
	}
	
	
	
	
}
