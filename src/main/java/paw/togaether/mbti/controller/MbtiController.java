package paw.togaether.mbti.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import paw.togaether.common.domain.CommandMap;
import paw.togaether.mbti.service.MbtiService;

	/** 23.01.11 이소영: MBTI 테스트 서버단, 프론트단 작성
	 *  23.01.13 이소영: MBTI test/ result jsp 분리 작성, 기능 구현
	*/

@Controller 		// 웹 클라이언트에서 들어온 요청을 해당 비지니스 로직 호출, 수행결과와 함께 응답해주는 Dispatcher
public class MbtiController {
	
	@Resource(name = "mbtiService")		// Service 영억 접근을 위한 선언(adminFaqServiceImpl의 이름과 통일)
	private MbtiService mbtiService;	// 빈 수동 등록

	Logger log = Logger.getLogger(this.getClass());
	
	// MBTI 테스트 시작 + 테스트
	@RequestMapping(value = "/mbti")	// 요청 URL. 주소는 @RequestMapping과 맵핑되어 해당 메서드 실행
	public ModelAndView mbtiTest(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/mbti/test");	// jsp 경로 설정
		
		session = request.getSession(false);	// 세션 요청. 세션이 없다면 null로 받기
		
		return mv;
	}
	
	// MBTI 테스트 결과
	@RequestMapping(value = "/mbti/result")
	public ModelAndView mbtiResult(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/mbti/result");
		
		String mbti =  request.getParameter("mbti");	// mtbi.pjsp에서 넘겨진 변수 mbti를 서버에서 저장
		mv.addObject("MEM_DOG_MBTI", mbti);
		
		session = request.getSession(false);

		return mv;
	}

	// MBTI 테스트 결과 저장
	@RequestMapping(value = "/mbti/modify")
	public ModelAndView mbtiModify(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/mbti/result.paw");
		
		Map<String, Object> map =  new HashMap<String, Object>();
		map = commandMap.getMap();
		
		String mbti =  request.getParameter("mbti");	// mtbi.pjsp에서 넘겨진 변수 mbti를 서버에서 저장
		mv.addObject("MEM_DOG_MBTI", mbti);
		
		mbtiService.mbtiModify(commandMap.getMap(), request);

		return mv;
	}
}
