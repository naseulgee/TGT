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

	@Override
	public void chattingRoom(Map<String, Object> map) throws Exception {
		chatDAO.chattingRoom(map);
		
	}

	@Override
	public void deleteChatRoom(Map<String, Object> map) throws Exception {
		chatDAO.deleteChatRoom(map);
		
	}

	@Override
	public void pulsPeople(Map<String, Object> map) throws Exception {
		chatDAO.puls_CR_PEOPLE(map);
		chatDAO.puls_CHAT_WITH(map);
	}

	@Override
	public int chatRoomCheck(Map<String, Object> map) throws Exception {
		int result = chatDAO.chatRoomCheck(map);
		return result;
	}

	@Override
	public int chatWithCheck(Map<String, Object> map) throws Exception {
		int result = chatDAO.chatWithCheck(map);
		return result;
	}

	@Override
	public void puls_CHAT_WITH(Map<String, Object> map) throws Exception {
		chatDAO.puls_CHAT_WITH(map);
	}

	@Override
	public void insertMessage(Map<String, Object> map) throws Exception {
		chatDAO.insertMessage(map);
	}

	@Override
	public List<Map<String, Object>> chatWihtList(Map<String, Object> map) throws Exception {
		return chatDAO.chatWihtList(map);
	}

	@Override
	public List<Map<String, Object>> chatMessageList(Map<String, Object> map) throws Exception {
		return chatDAO.chatMessageList(map);
	}

	@Override
	public void deleteChatWith(Map<String, Object> map) throws Exception {
		chatDAO.deleteChatWith(map);
		chatDAO.minus_CR_PEOPLE(map);
	}

	@Override
	public int chatWithCountCheck(Map<String, Object> map) throws Exception {
		int result = chatDAO.chatWithCountCheck(map);
		return result;
	}

}
