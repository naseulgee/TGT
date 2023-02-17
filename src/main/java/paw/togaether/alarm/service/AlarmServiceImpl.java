package paw.togaether.alarm.service;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import paw.togaether.alarm.dao.AlarmDAO;

/** 23.02.17 나슬기: 알람 관련 모든 작업을 처리하는 클래스 */
@Service("alarmService")
public class AlarmServiceImpl implements AlarmService {
	Logger log = Logger.getLogger(this.getClass());

	//알람 관련 DAO
	@Resource(name="alarmDAO")
	private AlarmDAO alarmDAO;
	
}