package paw.togaether.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import paw.togaether.board_comm.service.BoardService;
import paw.togaether.common.domain.CommandMap;
import paw.togaether.main.service.MainService;
import paw.togaether.together.service.TogetherService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class MainController {
	@Resource(name = "mainService")
	private MainService mainService;
	@Resource(name="togetherService")//함께해요
	private TogetherService togetherService;
	@Resource(name="boardService")//일반게시판
	private BoardService boardService;
	
	/* 23.02.08 나슬기: 메인 컨트롤러 */
	@RequestMapping("/main")
	public ModelAndView main(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/main/main");
		//각 서비스의 리스트들은 페이징 처리되어있기 때문에,
		//형식을 맞추기 위해 서비스를 호출하기 전 PAGE_INDEX와 PAGE_ROW를 넣어준다.
		commandMap.put("PAGE_INDEX", "1");
		
		//함께해요 게시글 리스트
		commandMap.put("PAGE_ROW", "3");
		mv.addObject("together", togetherService.togetherList(commandMap.getMap()));
		
		//자유게시판
		commandMap.put("BC_BCC_NAME", "자유게시판");
		commandMap.put("PAGE_ROW", "3");
		mv.addObject("free", boardService.boardList(commandMap.getMap()));
		
		//실종 게시판
		commandMap.put("BC_BCC_NAME", "긴급실종유기견");
		commandMap.put("PAGE_ROW", "6");
		mv.addObject("missing", boardService.boardList(commandMap.getMap()));
		
		//자원봉사 게시판
		commandMap.put("BC_BCC_NAME", "자원봉사구해요");
		commandMap.put("PAGE_ROW", "5");
		mv.addObject("volunteer", boardService.boardList(commandMap.getMap()));
		
		//정보 게시판
		commandMap.put("BC_BCC_NAME", "정보게시판");
		commandMap.put("PAGE_ROW", "10");
		mv.addObject("info", boardService.boardList(commandMap.getMap()));
		return mv;
	}
	
	/** 23.01.14 이소영 : 전체 검색 */
	@RequestMapping(value = "/search")
	public ModelAndView search(CommandMap commandMap, HttpServletRequest request,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "searchType", defaultValue = "") String searchType) throws Exception {
		ModelAndView mv = new ModelAndView("/main/search");
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		
		return mv;
	}
	
	@RequestMapping(value = "/search/board")
	public ModelAndView boardSearch(CommandMap commandMap, HttpServletRequest request,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "searchType", defaultValue = "") String searchType) throws Exception {
		ModelAndView mv = new ModelAndView("/main/search_board");
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		
		return mv;
	}

	@RequestMapping(value = "/paging/board")
	public ModelAndView boardSearchList(CommandMap commandMap, HttpServletRequest request,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "searchType", defaultValue = "") String searchType) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> boardSearchList = mainService.boardSearchList(commandMap.getMap(), keyword, searchType);

			mv.addObject("boardSearchList", boardSearchList);

			if (boardSearchList.size() > 0) {
				mv.addObject("TOTAL_B", boardSearchList.get(0).get("TOTAL_COUNT"));
			} else {
				mv.addObject("TOTAL_B", 0);
			}
			
		return mv;
	}
	
	@RequestMapping(value = "/search/together")
	public ModelAndView togetherSearch(CommandMap commandMap, HttpServletRequest request,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "searchType", defaultValue = "") String searchType) throws Exception {
		ModelAndView mv = new ModelAndView("/main/search_together");
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		
		return mv;
	}
	
	@RequestMapping(value = "/paging/together")
	public ModelAndView togetherSearchList(CommandMap commandMap, HttpServletRequest request,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "searchType", defaultValue = "") String searchType) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> togetherSearchList = mainService.togetherSearchList(commandMap.getMap(), keyword, searchType);

			mv.addObject("togetherSearchList", togetherSearchList);
			
			if (togetherSearchList.size() > 0) {
				mv.addObject("TOTAL_T", togetherSearchList.get(0).get("TOTAL_COUNT"));
			} else {
				mv.addObject("TOTAL_T", 0);
			}
			
		return mv;
	}
	
	@RequestMapping(value = "/search/place")
	public ModelAndView plceSearch(CommandMap commandMap, HttpServletRequest request,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "searchType", defaultValue = "") String searchType) throws Exception {
		ModelAndView mv = new ModelAndView("/main/search_place");
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		
		return mv;
	}
	
	@RequestMapping(value = "/paging/place")
	public ModelAndView placeSearchList(CommandMap commandMap, HttpServletRequest request,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "searchType", defaultValue = "") String searchType) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<Map<String, Object>> placeSearchList = mainService.placeSearchList(commandMap.getMap(), keyword, searchType);

			mv.addObject("placeSearchList", placeSearchList);

			if (placeSearchList.size() > 0) {
				mv.addObject("TOTAL_P", placeSearchList.get(0).get("TOTAL_COUNT"));
			} else {
				mv.addObject("TOTAL_P", 0);
			}
			
		return mv;
	}
}