package paw.togaether.alarm.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import paw.togaether.alarm.dao.AlarmDAO;

/** 23.02.17 나슬기: 23.02.17 나슬기: 알람 관련 모든 작업을 처리하는 클래스 */
@Service("alarmService")
public class AlarmServiceImpl implements AlarmService {
	Logger log = Logger.getLogger(this.getClass());

	// 알람 관련 DAO
	@Resource(name="alarmDAO")
	private AlarmDAO alarmDAO;
	
	/** 23.02.17 나슬기: 회원의 알람 개수 */
	@Override
	public int alarmCount(Map<String, Object> map) throws Exception{
		return alarmDAO.alarmSelectCount(map);
	}
	/** 23.02.17 나슬기: 회원의 알람 리스트 */
	@Override
	public List<Map<String, Object>>alarmList(Map<String, Object> map) throws Exception{
		return alarmDAO.alarmSelectList(map);
	}
	/** 23.02.17 나슬기: 알람 리스트 & 페이징 & 검색 */
	@Override
	public List<Map<String, Object>>alarmListWidthCondition(Map<String, Object> map) throws Exception{
		return alarmDAO.alarmSelectListWidthCondition(map);
	}
	/** 23.02.22 나슬기: 알람 발송할 회원 조회 */
	@Override
	public List<Map<String, Object>>alarmMemberSelectList(Map<String, Object> map) throws Exception{
		return alarmDAO.alarmMemberSelectList(map);
	}
	/** 23.02.17 나슬기: 알람 등록하기 */
	@Override
	public void alarmWrite(Map<String, Object> map) throws Exception{
		alarmDAO.alarmInsert(map);
	}
	/** 23.02.17 나슬기: 알람 수정 */
	@Override
	public int alarmModify(Map<String, Object> map) throws Exception{
		return alarmDAO.alarmUpdate(map);
	}
	/** 23.02.17 나슬기: 알람 삭제 */
	@Override
	public int alarmDelete(Map<String, Object> map) throws Exception{
		return alarmDAO.alarmDelete(map);
	}
}