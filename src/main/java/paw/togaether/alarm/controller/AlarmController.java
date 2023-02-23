package paw.togaether.alarm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import paw.togaether.alarm.service.AlarmService;
import paw.togaether.common.domain.CommandMap;

@Controller
public class AlarmController {
	Logger log = Logger.getLogger(this.getClass());
	
	//알람 관련 서비스
	@Resource(name="alarmService")
	private AlarmService alarmService;
	
	/** 23.02.20 나슬기: 회원의 안읽은 알람 개수 조회 메소드 */
	@PostMapping(value = "/alarm/non-check-count", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> nonCheckCount(Map<String, Object> commandMap, HttpSession session) throws Exception {
		//회원 ID 세팅
		String mem_id = (String)session.getAttribute("mem_id");
		if(mem_id == null || mem_id.equals("")) return new ResponseEntity<>(commandMap, HttpStatus.BAD_REQUEST);
		commandMap.put("mem_id", mem_id);
		
		//확인하지 않은 알람 총 개수
		commandMap.put("count", alarmService.alarmCount(commandMap));
		return new ResponseEntity<>(commandMap, HttpStatus.OK);
	}
	
	/** 23.02.20 나슬기: 회원의 알람 리스트 조회 메소드 */
	@RequestMapping("/mypage/alarm/list")
	public ModelAndView alramList(Map<String, Object> commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		//회원 ID 세팅
		String mem_id = (String)session.getAttribute("mem_id");
		commandMap.put("mem_id", mem_id);
		
		//알람 리스트 불러오기
		mv.addObject("list", alarmService.alarmList(commandMap));
		
		return mv;
	}
	
	/** 23.02.20 나슬기: 회원의 알람 확인 메소드 */
	@PostMapping(value = "/mypage/alarm/check", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<HttpStatus> alarmCheck(@RequestBody Map<String, Object> commandMap) throws Exception {
		//Mybatis에서 동적쿼리문으로 반복 처리하기 위해 신규 맵을 생성하여 다시 담아준다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("map", commandMap);
		map.put("target", commandMap.get("target"));
		
		//알람 확인 처리
		int result = alarmService.alarmModify(map);
		if(result > 0) return new ResponseEntity<>(HttpStatus.OK);
		return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	}
	
	/** 23.02.20 나슬기: 회원의 알람 삭제 메소드 */
	@PostMapping("/mypage/alarm/delete")
	public ModelAndView alarmDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/mypage/alarm/list.paw");
		
		//알람 삭제
		alarmService.alarmDelete(commandMap.getMap());
		
		return mv;
	}
}