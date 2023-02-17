package paw.togaether.alarm.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import paw.togaether.alarm.service.AlarmService;

@Controller
@RequestMapping("/admin/alarm")
public class AlarmAdminController {
	Logger log = Logger.getLogger(this.getClass());
	
	//알람 관련 서비스
	@Resource(name="alarmService")
	private AlarmService alarmService;
	
	/** 23.02.17 나슬기: 알람 조회 메소드 */
	@GetMapping("/list")
	public void alarmList(){}
	
	/** 23.02.17 나슬기: 알람 조회 메소드 */
	@PostMapping(value = "/list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> alarmList(@RequestBody Map<String, Object> commandMap) throws Exception {
		//리턴용 맵 생성
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		//Mybatis에서 동적쿼리문으로 반복 처리하기 위해 신규 맵을 생성하여 다시 담아준다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("map", commandMap);
		
		//조건에 맞는 알람 리스트 불러오기
		List<Map<String, Object>> list = alarmService.alarmList(map);
		resultMap.put("list", list);
		//총 개수
		if (list.size() > 0) {
			resultMap.put("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			resultMap.put("TOTAL", 0);
		}
		return new ResponseEntity<>(resultMap, HttpStatus.OK);
	}
	
	/** 23.02.17 나슬기: 알람 작성 메소드 */
	@PostMapping(value = "/write", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<HttpStatus> alarmReg(@RequestBody Map<String, Object> commandMap) throws Exception {
		//서비스 호출 전 체크박스로 넘어오는 회원ID 정보에 대한 가공 처리 필수!
		if(commandMap.get("target") != null) {
			Object[] off_check = (Object[]) commandMap.get("target");//해당 값을 문자열로 이루어진 배열에 저장
			commandMap.put("target",
					Arrays.deepToString(off_check)
					.toString()
					.replaceAll(" ", "")
					.replace("[", "")
					.replace("]", ""));//배열을 문자열로 변환 후 공백 및 [] 제거
		}
		try {
			alarmService.alarmWrite(commandMap);
		}catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.EXPECTATION_FAILED);
		}
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	/** 23.02.17 나슬기: 알람 수정 메소드 */
	@PostMapping(value = "/modify", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<Integer> alarmModi(@RequestBody Map<String, Object> commandMap) throws Exception {
		//Mybatis에서 동적쿼리문으로 반복 처리하기 위해 신규 맵을 생성하여 다시 담아준다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("map", commandMap);
		
		return new ResponseEntity<>(alarmService.alarmModify(map), HttpStatus.OK);
	}
	
	/** 23.02.17 나슬기: 알람 삭제 메소드 */
	@PostMapping(value = "/delete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<Integer> alarmDelete(@RequestBody Map<String, Object> commandMap) throws Exception {
		//Mybatis에서 동적쿼리문으로 반복 처리하기 위해 신규 맵을 생성하여 다시 담아준다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("map", commandMap);
		
		return new ResponseEntity<>(alarmService.alarmDelete(map), HttpStatus.OK);
	}
}