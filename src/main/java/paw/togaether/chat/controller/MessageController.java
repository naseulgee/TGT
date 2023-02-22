package paw.togaether.chat.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import lombok.extern.log4j.Log4j;
import paw.togaether.chat.dto.Message;
import paw.togaether.chat.service.ChatService;
import paw.togaether.common.domain.CommandMap;

@Log4j
@Controller
public class MessageController {
	
	@Resource(name = "chatService")
	private ChatService chatService;
	
	CommandMap commandMap = new CommandMap();
	

	// 채팅방에서 메세지 보내기
	@MessageMapping("/socket/sendMessage/{roomNumber}")
	@SendTo("/topic/message/{roomNumber}")
	public Message sendMessage(@DestinationVariable String roomNumber, Message message) throws Exception {

		log.info(message);
		
		commandMap.put("CH_CR_IDX", roomNumber);
		commandMap.put("CH_MESSAGE_TYPE", "CHAT");
		commandMap.put("CH_SENDER", message.getNickname());
		commandMap.put("CH_MESSAGE", message.getMessage());
		
		chatService.insertMessage(commandMap.getMap());
		
		return message;
	}

	// 채팅방에 입장 퇴장 메세지 보내기
	@MessageMapping("/socket/notification/{roomNumber}")
	@SendTo("/topic/notification/{roomNumber}")
	public Map<String, Object> notification(@DestinationVariable String roomNumber, Map<String, Object> chattingRoom) throws Exception {
		return chattingRoom;
	}
}
