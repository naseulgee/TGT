package paw.togaether.alarm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import paw.togaether.alarm.service.AlarmService;

@Controller
@RequestMapping("/alarm")
public class AlarmController {
	Logger log = Logger.getLogger(this.getClass());
	
	//알람 관련 서비스
	@Resource(name="alarmService")
	private AlarmService alarmService;
	
	/** 23.02.17 나슬기: 회원의 알람 조회 메소드 */
	@PostMapping(value = "/list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> placeList(@RequestBody Map<String, Object> commandMap) throws Exception {
		Map<String, Object> m = new HashMap<String, Object>();
		//알람 리스트 불러오기
		m.put("list", alarmService.alarmList(commandMap));
		//총 개수
		m.put("count", alarmService.alarmCount(commandMap));
		return new ResponseEntity<>(m, HttpStatus.OK);
	}
}