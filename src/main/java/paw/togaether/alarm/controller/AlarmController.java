package paw.togaether.alarm.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import paw.togaether.alarm.service.AlarmService;

@Controller
@RequestMapping("/alarm")
public class AlarmController {
	Logger log = Logger.getLogger(this.getClass());
	
	//알람 관련 서비스
	@Resource(name="alarmService")
	private AlarmService alarmService;
}