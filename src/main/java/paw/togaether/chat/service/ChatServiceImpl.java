package paw.togaether.chat.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import paw.togaether.chat.dao.ChatDAO;

@Service("chatService")
public class ChatServiceImpl implements ChatService {
	
	@Resource(name = "chatDAO")
	private ChatDAO chatDAO;

	// 채팅방 만들기
	@Override
	public void chattingRoom(Map<String, Object> map) throws Exception {
		chatDAO.chattingRoom(map);
		
	}

	// 채팅방 삭제
	@Override
	public void deleteChatRoom(Map<String, Object> map) throws Exception {
		chatDAO.cleanChatWith(map);
		chatDAO.deleteChatRoom(map);
	}

	// 채팅방 입장시 참가 인원수 증가, 참가 멤버 id 추가
	@Override
	public void pulsPeople(Map<String, Object> map) throws Exception {
		chatDAO.puls_CR_PEOPLE(map);
		chatDAO.puls_CHAT_WITH(map);
	}

	// 채팅방 중복 체크
	@Override
	public int chatRoomCheck(Map<String, Object> map) throws Exception {
		int result = chatDAO.chatRoomCheck(map);
		return result;
	}

	// 채팅방 참가회원 중복 체크
	@Override
	public int chatWithCheck(Map<String, Object> map) throws Exception {
		int result = chatDAO.chatWithCheck(map);
		return result;
	}

	// 채팅방 입장 시 CHAT_WITH 추가
	@Override
	public void puls_CHAT_WITH(Map<String, Object> map) throws Exception {
		chatDAO.puls_CHAT_WITH(map);
	}

	// 채팅 메세지 저장
	@Override
	public void insertMessage(Map<String, Object> map) throws Exception {
		chatDAO.insertMessage(map);
	}

	// CHAT_WITH 리스트
	@Override
	public List<Map<String, Object>> chatWihtList(Map<String, Object> map) throws Exception {
		return chatDAO.chatWihtList(map);
	}

	// MESSAGE 리스트
	@Override
	public List<Map<String, Object>> chatMessageList(Map<String, Object> map) throws Exception {
		return chatDAO.chatMessageList(map);
	}

	// 채팅방 참가회원 삭제
	@Override
	public void deleteChatWith(Map<String, Object> map) throws Exception {
		chatDAO.deleteChatWith(map);
		chatDAO.minus_CR_PEOPLE(map);
	}

	// 채팅방 참가 인원 조회
	@Override
	public int chatWithCountCheck(Map<String, Object> map) throws Exception {
		int result = chatDAO.chatWithCountCheck(map);
		return result;
	}

}
