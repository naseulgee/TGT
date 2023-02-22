package paw.togaether.alarm.service;

import java.util.List;
import java.util.Map;

public interface AlarmService {
	//회원의 알람 개수
	int alarmCount(Map<String, Object> map) throws Exception;
	//회원의 알람 리스트
	List<Map<String, Object>>alarmList(Map<String, Object> map) throws Exception;
	//알람 리스트 & 페이징 & 검색
	List<Map<String, Object>>alarmListWidthCondition(Map<String, Object> map) throws Exception;
	//알람 발송할 회원 조회
	List<Map<String, Object>>alarmMemberSelectList(Map<String, Object> map) throws Exception;
	//알람 등록하기
	void alarmWrite(Map<String, Object> map) throws Exception;
	//알람 수정
	int alarmModify(Map<String, Object> map) throws Exception;
	//알람 삭제
	int alarmDelete(Map<String, Object> map) throws Exception;
}