package paw.togaether.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import paw.togaether.common.domain.CommandMap;
import paw.togaether.main.service.MainService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class MainController {
	
	@Resource(name = "mainService")
	private MainService mainService;
	
	@RequestMapping(value = "/search")
	public ModelAndView search(CommandMap commandMap, HttpServletRequest request,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "searchType", defaultValue = "") String searchType) throws Exception {
		ModelAndView mv = new ModelAndView("main/search");
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		
		return mv;
	}
	
	
	@RequestMapping(value = "/search/board")
	public ModelAndView boardSearch(CommandMap commandMap, HttpServletRequest request,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "searchType", defaultValue = "") String searchType) throws Exception {
		ModelAndView mv = new ModelAndView("main/search_board");
		
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
		ModelAndView mv = new ModelAndView("main/search_together");
		
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
		ModelAndView mv = new ModelAndView("main/search_place");
		
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