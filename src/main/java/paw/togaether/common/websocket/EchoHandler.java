package paw.togaether.common.websocket;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {	//웹소켓 클라이언트와 연결될 때 호출
		
		System.out.printf("%s 연결됨\n", session.getId());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception { // 웹소켓 클라이언트가 텍스트 메세지를 전송할 때 호출되는 메서드
		
		System.out.printf("%s로 부터 [%s] 받음\n", session.getId(), message.getPayload());
																//message는 클라이언트가 전송한 텍스트 데이터를 담고 있으며 message.getPayload()를 이용해 텍스트 데이터를 구함
		session.sendMessage(new TextMessage("echo : " + message.getPayload()));
		//웹소켓 클라이언트에 데이터 전송
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {	//웹소켓 클라이언트와 연결이 종료될 때 호출
		System.out.printf("%s 연결 끊김 \n", session.getId());
	}

}
