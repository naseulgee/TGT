package paw.togaether.chat.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

@Repository("chatDAO")
public class ChatDAO extends AbstractDAO {

	public void chattingRoom(Map<String, Object> map) throws Exception {
		insert("chat.chattingRoom", map);
	}

	public void deleteChatRoom(Map<String, Object> map) throws Exception {
		delete("chat.deleteChatRoom", map);
	}

	public void puls_CR_PEOPLE(Map<String, Object> map) throws Exception {
		update("chat.puls_CR_PEOPLE", map);
	}

	public void puls_CHAT_WITH(Map<String, Object> map) throws Exception {
		insert("chat.puls_CHAT_WITH", map);
		
	}

	public int chatRoomCheck(Map<String, Object> map) throws Exception {
		int result = selectOneInt("chat.chatRoomCheck", map);
		return result;
	}

	public int chatWithCheck(Map<String, Object> map) throws Exception {
		int result = selectOneInt("chat.chatWithCheck", map);
		return result;
	}

	public void insertMessage(Map<String, Object> map) throws Exception {
		insert("chat.insertMessage", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> chatWihtList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("chat.chatWihtList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> chatMessageList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("chat.chatMessageList", map);
	}

	public void deleteChatWith(Map<String, Object> map) throws Exception {
		delete("chat.deleteChatWith", map);
	}
	
	public void minus_CR_PEOPLE(Map<String, Object> map) {
		update("chat.minus_CR_PEOPLE", map);	
		}
	
	public int chatWithCountCheck(Map<String, Object> map) throws Exception {
		int result = selectOneInt("chat.chatWithCountCheck", map);
		return result;
	}

	

}
