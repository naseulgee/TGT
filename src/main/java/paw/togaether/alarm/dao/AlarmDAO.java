package paw.togaether.alarm.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

/** 23.02.17 나슬기: alarm_SQL.xml과 맵핑되는 DAO 클래스 */
@Repository("alarmDAO")
public class AlarmDAO extends AbstractDAO {
	/** 23.02.17 나슬기: 알람 개수 조회 메소드 */
	public int alarmSelectCount(Map<String, Object> map) throws Exception{
		return Integer.parseInt(selectOne("alarm.se_al_count", map).toString());
	}
	
	/** 23.02.17 나슬기: 알람 조회 메소드. 특정 회원의 일주일치만 조회되기 때문에 페이징 처리는 하지 않는다. */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> alarmSelectList(Map<String, Object> map) throws Exception{
		return selectList("alarm.se_al", map);
	}
	
	/** 23.02.17 나슬기: 조회 조건을 전달한 알람 조회 메소드 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> alarmSelectListWidthCondition(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("alarm.se_al_with_condition", map);
	}
	
	/** 23.02.17 나슬기: 알람 추가 메소드 */
	public void alarmInsert(Map<String, Object> map) throws Exception{
		insert("alarm.in_al", map);
	}
	
	/** 23.02.17 나슬기: 알람 수정 메소드 */
	public int alarmUpdate(Map<String, Object> map) throws Exception{
		return Integer.parseInt(update("alarm.up_al", map).toString());
	}
	
	/** 23.02.17 나슬기: 알람 삭제 메소드 */
	public int alarmDelete(Map<String, Object> map) throws Exception{
		return Integer.parseInt(delete("alarm.de_al", map).toString());
	}
}