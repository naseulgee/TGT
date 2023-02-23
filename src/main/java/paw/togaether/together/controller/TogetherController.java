package paw.togaether.together.controller;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import paw.togaether.chat.service.ChatService;
import paw.togaether.common.domain.CommandMap;
import paw.togaether.together.service.TogetherService;
	/**
	 *	23.02.17 투게더 게스글 마감/ 삭제시 체팅 방 삭제 기능 추가
	 */

@Controller
public class TogetherController {
	Logger log = Logger.getLogger(this.getClass());
	
	//togetherService의 빈 객체에 의존
	@Resource(name="togetherService")
	private TogetherService togetherService;
	
	
	/* 23.02.02 박선영 게시글리스트 페이징화면출력 */
	@RequestMapping(value="/together/openList")
	public ModelAndView openList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/together/togetherList");//JSP를 불러오는 역할
		
		Date now = new Date();//현재날짜
		
		System.out.println("now :" + now);
		
		mv.addObject("now", now);
		return mv;
	}
	
	/* 23.01.12 박선영 : 함께해요 전체 게시판 리스트와 검색 메소드 작성 */
	/* 23.01.25 박선영 : 함께해요 카테고리 수정 반영
	 * 23.02.02 박선영 함께해요 게시글 리스트 페이징 완료 */
	@RequestMapping(value="/together/list")
	public ModelAndView togetherList(CommandMap commandMap) throws Exception { 
		
		
		//ModelAndView 객체 생성 후 데이터를 넘길 페이지의 값 지정
		//ModelAndView mv = new ModelAndView("/together/togetherList"); 
		ModelAndView mv = new ModelAndView("jsonView");
		
		Date now = new Date();//현재날짜
		
		//서비스의 togetherList 메소드의 결과 map 형태의 resultMap 변수에 저장
		List<Map<String, Object>> list = togetherService.togetherList(commandMap.getMap());
		/* 분류별 넘겨주는 데이터를 다르게 하기 위함 */
		List<Map<String, Object>> catelist = togetherService.togetherCate(commandMap.getMap());
		
		
		//get()으로 받은 commandMap의 값들을 mv에 ""이름으로 저장
		mv.addObject("now",now);
		mv.addObject("catelist", catelist);
		mv.addObject("list", list);
		
		if (list.size() > 0) {
			mv.addObject("TOTAL_T", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL_T", 0);
		}//페이징
		
		return mv;		
	}
	
	//23.01.16 박선영 : 게시글 작성 폼으로의 이동 
	@RequestMapping(value="/together/writeForm")
	public ModelAndView openTogetherWrite(CommandMap commandMap, HttpSession session) throws Exception {
		
		System.out.println(session.getAttribute("mem_id"));
		
		ModelAndView mv = new ModelAndView("/together/togetherWrite");
		
		Date now = new Date();//현재날짜
		/* 견종분류 셀렉트 박스 만들용도 */
		List<Map<String, Object>> brlist = togetherService.togetherbreed(commandMap.getMap());
		/* 카테고리 분류 셀렉트박스 만들용도 */
		List<Map<String, Object>> catelist = togetherService.togetherCate(commandMap.getMap());
		
		System.out.println("now:" + now);
		mv.addObject("now", now);
		mv.addObject("catelist", catelist);
		mv.addObject("brlist", brlist);
		return mv;
	}
	//23.01.16 박선영 : 작성한 게시글 insert 하기
	@RequestMapping(value="/together/write")
	public ModelAndView togetherWrite(CommandMap commandMap, HttpSession session) throws Exception {
		System.out.println(commandMap.getMap());
		//작성폼 작성 후 게시글 리스트로 리다이렉트
		System.out.println(session.getAttribute("mem_id"));
		
		ModelAndView mv = new ModelAndView("redirect:/together/openList.paw");
		
		togetherService.togetherWrite(commandMap.getMap(), session);
		return mv;
	}
	
	/* 23.01.18 박선영 : 게시글 상세보기 이동 
	 * 23.01.31 박선영 : 참여여부 확인 메소드 추가*/
	@RequestMapping(value="/together/detail/{TO_IDX}")
	public ModelAndView togetherDetail(@PathVariable("TO_IDX") int TO_IDX, CommandMap commandMap, HttpSession session)throws Exception {
		
		//값을 잘 받아오는지 확인하는 용도
		System.out.println(TO_IDX);
		System.out.println(commandMap.getMap());
		System.out.println(session.getAttribute("mem_id"));
		commandMap.put("TO_IDX", TO_IDX);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//날짜 형태 정해주기
		SimpleDateFormat tsdf = new SimpleDateFormat("HH:mm");//시간형태 정해주기
		
		Date now = new Date();//날짜 마감에 따른 참여하기 비활성화 목적
		
		String nowDate = sdf.format(now);
		String nowTime = tsdf.format(now);
		
		ModelAndView mv = new ModelAndView("/together/togetherDetail");
		
		Map<String, Object> map = togetherService.togetherDetail(commandMap.getMap(),session);//상세보기 정보
		List<Map<String, Object>> withlist = togetherService.togetherWithList(commandMap.getMap());//참여자 리스트 메소드
		Map<String, Object> checkwith = togetherService.checkWith(commandMap.getMap(),session);//참여여부 확인 메소드
		
		mv.addObject("nowTime", nowTime);
		mv.addObject("nowDate", nowDate);
		mv.addObject("checkwith", checkwith);	
		mv.addObject("withlist", withlist);
		mv.addObject("map", map);
		
		return mv;
		
	}
	
	/* 23.02.02 박선영 게시글리스트 페이징화면출력 */
	@RequestMapping(value="/together/openCateList")
	public ModelAndView openCateList(CommandMap commandMap) throws Exception {
		System.out.println(commandMap.getMap());
		
		ModelAndView mv = new ModelAndView("/together/togetherCateList");//JSP를 불러오는 역할
		
		String TC_NAME = (String) commandMap.get("TC_NAME");
		
		mv.addObject("TC_NAME", TC_NAME);
		return mv;
	}
	
	/*23.01.19 박선영: 카테고리별 리스트 출력 
	 * 23.02.02 박선영 : 카테고리별 리스트 페이징*/
	@RequestMapping(value="/together/catelist")
	public ModelAndView togetherCateList(CommandMap commandMap, HttpSession session) throws Exception {
		
		System.out.println(commandMap.getMap());
		System.out.println(commandMap.get("TC_NAME"));
		
		ModelAndView mv = new ModelAndView("jsonView");
		
		//전체 카테고리별 리스트
		List<Map<String, Object>> list = togetherService.togetherCateList(commandMap.getMap(),session);
		//카테고리별 리스트 버튼
		List<Map<String, Object>> catelist = togetherService.togetherCate(commandMap.getMap());
		
		mv.addObject("catelist", catelist);
		//mv.addObject(commandMap.get("TC_NAME"));
		mv.addObject("list",list);
		
		if (list.size() > 0) {
			mv.addObject("TOTAL_T", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL_T", 0);
		}//페이징
		
		return mv;
	}
	
	/* 23.01.20 박선영 게시글 수정폼 */
	/* 23.01.25 카테고리 분류 리스트 추가 */
	@RequestMapping(value="/together/modifyForm")
	public ModelAndView openTogetherModi(CommandMap commandMap, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView("/together/togetherModi");
		
		System.out.println(commandMap.getMap());
		System.out.println(session.getAttribute("mem_id"));
		//이미 써놨던 게시글 상세정보를 불러옴
		Map<String, Object> map = togetherService.togetherDetail(commandMap.getMap(),session);
		/* 견종분류 셀렉트 박스 만들용도 */
		List<Map<String, Object>> brlist = togetherService.togetherbreed(commandMap.getMap());
		/* 카테고리 분류 셀렉트박스 만들용도 */
		List<Map<String, Object>> catelist = togetherService.togetherCate(commandMap.getMap());
		
		mv.addObject("catelist", catelist);
		mv.addObject("brlist", brlist);
		mv.addObject("map",map);
		
		return mv;
	}
	
	/* 23.01.20 박선영 게시글 수정하기 */
	@RequestMapping(value="/together/modify", method = RequestMethod.POST)
	public ModelAndView togetherModi(CommandMap commandMap, HttpSession session) throws Exception {
		
		//session.setAttribute("mem_id", "user1");
		ModelAndView mv = new ModelAndView("redirect:/together/openList.paw");
		
		System.out.println(commandMap.get("TO_IDX"));
		System.out.println(session.getAttribute("mem_id"));
		
		togetherService.togetherModi(commandMap.getMap(),session);
		mv.addObject("TO_IDX", commandMap.get("TO_IDX"));
		
		return mv;
	}
	
	/* 23.01.23 박선영 게시글 삭제하기 */
	@RequestMapping(value="/together/delete", method = RequestMethod.POST)
	public ModelAndView togetherDel(CommandMap commandMap, HttpSession session) throws Exception {
		
		//session.setAttribute("mem_id", "user1");
		ModelAndView mv = new ModelAndView("redirect:/together/openList.paw");
		
		System.out.println(commandMap.get("TO_IDX"));
		
		togetherService.togetherDel(commandMap.getMap(),session);
		
		return mv;
	}
	
	/* 23.01.27 박선영 참여하기 
	 * 23.01.30 참여하기 기능 구현완료*/
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/together/with", method=RequestMethod.POST)
	public ModelAndView togetherWith(@RequestBody Map commandMap, HttpSession session) throws Exception {
		
		session.getAttribute("mem_id");
		
		ModelAndView mv = new ModelAndView("jsonView");
			
		System.out.println("TW_TO_IDX :" + commandMap);
		System.out.println("mem_id:" + session.getAttribute("mem_id"));
		
		togetherService.togetherWith(commandMap, session);

		mv.addObject(commandMap);
		return mv;
		
	}
	
	/* 23.01.31 박선영 참여취소 기능 구현 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="/together/withdel")
	public ModelAndView togetherWithDel(@RequestBody Map commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("jsonView");
		
		System.out.println("map: " + commandMap);
		
		togetherService.togetherWithDel(commandMap);
		
		return mv;
	}
	
	/* 23.02.06 박선영 참여멤버 상세보기
	 * 23.02.09 박선영 작성자 상세보기 */
	@RequestMapping(value="/together/withdetail")
	public ModelAndView checkMem(CommandMap commandMap, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView("/together/togeWithDetail");
		
		System.out.println("map : " + commandMap.getMap());
		
		Map<String, Object> withdetail = togetherService.checkMem(commandMap.getMap(), session);
	
		mv.addObject("withdetail", withdetail);
		return mv;
	}
	
	/* 23.02.09 박선영 작성자 상세보기 */
	@RequestMapping(value="/together/writerdetail")
	public ModelAndView checkWriter(CommandMap commandMap, HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView("/together/togeWriterDetail");
		
		System.out.println("map : " + commandMap.getMap());
		
		Map<String, Object> wtdetail = togetherService.checkWriter(commandMap.getMap(), session);
		
		mv.addObject("wtdetail", wtdetail);
		return mv;
	}
	
	/* 23.02.23 박선영 참여거절 기능 구현 */
	@RequestMapping(value="/together/withreject", method=RequestMethod.POST)
	public ModelAndView withDel(CommandMap commandMap, HttpSession session) throws Exception {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//날짜 형태 정해주기
		SimpleDateFormat tsdf = new SimpleDateFormat("HH:mm");//시간형태 정해주기
		
		Date now = new Date();//날짜 마감에 따른 참여하기 비활성화 목적
		
		String nowDate = sdf.format(now);
		String nowTime = tsdf.format(now);
		
		ModelAndView mv = new ModelAndView("redirect:/together/detail/{TO_IDX}");
		
		System.out.println("commandmap: " + commandMap);
		
		Map<String, Object> map = togetherService.togetherDetail(commandMap.getMap(),session);//상세보기 정보
		togetherService.withDel(commandMap.getMap(), session);
		
		String TO_IDX = (String)commandMap.get("TO_IDX");
		commandMap.put("TO_IDX", TO_IDX);
		
		mv.addObject("nowTime", nowTime);
		mv.addObject("nowDate", nowDate);
		mv.addObject("TO_IDX", TO_IDX);
		return mv;
	}
	
}
