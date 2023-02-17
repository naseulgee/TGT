package paw.togaether.chat.service;

import java.util.List;
import java.util.Map;

public interface ChatService {

	// 채팅방 만들기
	void chattingRoom(Map<String, Object> map) throws Exception;

	// 채팅방 삭제
	void deleteChatRoom(Map<String, Object> map) throws Exception;

	// 채팅방 입장시 참가 인원수 증가, 참가 멤버 id 추가
	void pulsPeople(Map<String, Object> map) throws Exception;

	// 채팅방 중복 체크
	int chatRoomCheck(Map<String, Object> map) throws Exception;

	// 채팅방 참가회원 중복 체크
	int chatWithCheck(Map<String, Object> map) throws Exception;

	// 채팅방 입장 시 CHAT_WITH 추가
	void puls_CHAT_WITH(Map<String, Object> map) throws Exception;

	// 채팅 메세지 저장
	void insertMessage(Map<String, Object> map) throws Exception;

	// CHAT_WITH 리스트
	List<Map<String, Object>> chatWihtList(Map<String, Object> map) throws Exception;

	// MESSAGE 리스트
	List<Map<String, Object>> chatMessageList(Map<String, Object> map) throws Exception;

	// 채팅방 참가회원 삭제
	void deleteChatWith(Map<String, Object> map) throws Exception;

	// 채팅방 참가 인원 조회
	int chatWithCountCheck(Map<String, Object> map) throws Exception;

}
