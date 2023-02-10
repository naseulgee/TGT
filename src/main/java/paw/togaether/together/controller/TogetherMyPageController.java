package paw.togaether.together.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import paw.togaether.common.domain.CommandMap;
import paw.togaether.together.service.TogetherMyPageService;

@Controller
public class TogetherMyPageController {
	
Logger log = Logger.getLogger(this.getClass());
	
	//togetherService의 빈 객체에 의존
	@Resource(name="togetherMyPageService")
	private TogetherMyPageService togetherMyPageService;
	
	/* 23.02.08 박선영 마이페이지 게시글 리스트 출력 */
	@RequestMapping(value="/mypage/together/list")
	public ModelAndView myTogetherList(CommandMap commandMap, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView("/mypage/together/togeMyPageList");
		
		System.out.println("mem_id: " + session.getAttribute("mem_id"));
		System.out.println(commandMap.getMap());//값을 잘 받아오는지 확인
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//날짜 형태 정해주기
		
		Date now = new Date();//날짜 마감에 따른 참여하기 비활성화 목적
		
		String nowDate = sdf.format(now);
		
		String mem_id = (String)session.getAttribute("mem_id");
		commandMap.put("mem_id", mem_id);
		
		List<Map<String, Object>> list = togetherMyPageService.myTogetherList(commandMap.getMap(),session);
		
		mv.addObject("nowDate", nowDate);
		mv.addObject("list", list);
		
		return mv;
	}
	
	/* 23.02.09 박선영 나의 함께해요 작성한 게시글 리스트 */
	@RequestMapping(value="/mypage/together/writelist")
	public ModelAndView myTogeWriteList(CommandMap commandMap, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView("/mypage/together/togeMyWriteList");
		
		System.out.println("mem_id: " + session.getAttribute("mem_id"));
		System.out.println(commandMap.getMap());//값을 잘 받아오는지 확인
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//날짜 형태 정해주기
		
		Date now = new Date();//날짜 마감에 따른 참여하기 비활성화 목적
		
		String nowDate = sdf.format(now);
		
		String mem_id = (String)session.getAttribute("mem_id");
		commandMap.put("mem_id", mem_id);//mem_id 넣기
		
		List<Map<String, Object>> wtlist = togetherMyPageService.myTogeWriteList(commandMap.getMap(),session);
		
		mv.addObject("nowDate", nowDate);
		mv.addObject("wtlist", wtlist);
		
		return mv;
	}

}
