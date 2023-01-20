package paw.togaether.main.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

//import org.apache.tiles.request.collection.AddableParameterMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import paw.togaether.board_comm.service.BoardService;
import paw.togaether.common.domain.CommandMap;
import paw.togaether.main.service.MainService;

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
				mv.addObject("TOTAL", boardSearchList.get(0).get("TOTAL_COUNT"));
			} else {
				mv.addObject("TOTAL", 0);
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
				mv.addObject("TOTAL", togetherSearchList.get(0).get("TOTAL_COUNT"));
			} else {
				mv.addObject("TOTAL", 0);
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
				mv.addObject("TOTAL", placeSearchList.get(0).get("TOTAL_COUNT"));
			} else {
				mv.addObject("TOTAL", 0);
			}
			
		return mv;
	}

	

	
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//	@RequestMapping(value = "/search")
//	public ModelAndView mainSearch(CommandMap commandMap, HttpServletRequest request) throws Exception {
//		ModelAndView mv = new ModelAndView("main/search");
//		
//		List<Map<String, Object>> boardSearchList = mainService.boardSearchList(commandMap.getMap());
//		
//		isSearch = request.getParameter("isSearch");
//
//		if (isSearch != null) {
//			searchNum = Integer.parseInt(request.getParameter("searchNum"));
//			commandMap.put("searchNum", searchNum);
//			commandMap.put("isSearch", isSearch);
//
//			if (searchNum == 0) { // 제목
//				boardSearchList = mainService.boardSearch0(commandMap.getMap());
//			} else if (searchNum == 1) { // 작성자
//				boardSearchList = mainService.boardSearch1(commandMap.getMap());
//			}
//			mv.addObject("boardSearchList", boardSearchList);
//		}
//		return mv;
//
//	}
//	
//	@RequestMapping(value = "/search0")
//	public ModelAndView selectBoardList(CommandMap commandMap, HttpServletRequest request) throws Exception {
//		ModelAndView mv = new ModelAndView("jsonView");
//
//		List<Map<String, Object>> boardSearchList = mainService.boardSearchList(commandMap.getMap());
//
//			mv.addObject("boardSearchList", boardSearchList);
//
//			if (boardSearchList.size() > 0) {
//				mv.addObject("TOTAL", boardSearchList.get(0).get("TOTAL_COUNT"));
//			} else {
//				mv.addObject("TOTAL", 0);
//			}
//
//		return mv;
//	}

	
	
	
	
	
// list를 json 받는 메소드로 넘겨주기	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//	List<Map<String, Object>> boardSearchList;
//	
//	@RequestMapping(value = "/search")
//	public ModelAndView mainSearch(CommandMap commandMap, HttpServletRequest request) throws Exception {
//		ModelAndView mv = new ModelAndView("main/search");
//		
//		boardSearchList = mainService.boardSearchList(commandMap.getMap());
//		
//		isSearch = request.getParameter("isSearch");
//
//		if (isSearch != null) {
//			searchNum = Integer.parseInt(request.getParameter("searchNum"));
//			commandMap.put("searchNum", searchNum);
//			commandMap.put("isSearch", isSearch);
//
//			if (searchNum == 0) { // 제목
//				boardSearchList = mainService.boardSearch0(commandMap.getMap());
//			} else if (searchNum == 1) { // 작성자
//				boardSearchList = mainService.boardSearch1(commandMap.getMap());
//			}
//			mv.addObject("boardSearchList", boardSearchList);
//		}
//		return mv;
//	}
//	
//	@RequestMapping(value = "/search0")
//	public ModelAndView selectBoardList(CommandMap commandMap, HttpServletRequest request) throws Exception {
//		ModelAndView mv = new ModelAndView("jsonView");
//
//		mv.addObject("boardSearchList", boardSearchList);
//
//		if (boardSearchList.size() > 0) {
//			mv.addObject("TOTAL", boardSearchList.get(0).get("TOTAL_COUNT"));
//		} else {
//			mv.addObject("TOTAL", 0);
//		}
//
//		return mv;
//	}

	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//	@RequestMapping(value = "/search0")
//	public ModelAndView selectBoardList(CommandMap commandMap, HttpServletRequest request) throws Exception {
//		ModelAndView mv = new ModelAndView("jsonView");
//
//		List<Map<String, Object>> boardSearchList = mainService.boardSearchList(commandMap.getMap());
//
//		isSearch = request.getParameter("isSearch");
//
//		if (isSearch != null ) {
//			searchNum = Integer.parseInt(request.getParameter("searchNum"));
//			commandMap.put("searchNum", searchNum);
//			commandMap.put("isSearch", isSearch);
//
//			if (searchNum == 0) { // 제목
//				boardSearchList = mainService.boardSearch0(commandMap.getMap());
//			} else if (searchNum == 1) { // 작성자
//				boardSearchList = mainService.boardSearch1(commandMap.getMap());
//			}
//			
//			if (boardSearchList.size() > 0) {
//				mv.addObject("TOTAL", boardSearchList.get(0).get("TOTAL_COUNT"));
//			} else {
//				mv.addObject("TOTAL", 0);
//			}
//			
//			mv.addObject("boardSearchList", boardSearchList);
//		
//		} else {
//			if (boardSearchList.size() > 0) {
//				mv.addObject("TOTAL", boardSearchList.get(0).get("TOTAL_COUNT"));
//			} else {
//				mv.addObject("TOTAL", 0);
//			}
//			mv.addObject("boardSearchList", boardSearchList);
//		}
//		return mv;
//	}

	
	
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////	
//	List<Map<String , Object>> boardSearchList = new ArrayList<Map<String,Object>>();
//	
//	@RequestMapping(value = "/search")
//	public ModelAndView mainSearch(CommandMap commandMap, HttpServletRequest request) throws Exception {
//		ModelAndView mv = new ModelAndView("main/search");
//		
//		boardSearchList = mainService.boardSearchList(commandMap.getMap());
//		
//		isSearch = request.getParameter("isSearch");
//
//		if (isSearch != null) {
//			searchNum = Integer.parseInt(request.getParameter("searchNum"));
//			commandMap.put("searchNum", searchNum);
//			commandMap.put("isSearch", isSearch);
//
//			if (searchNum == 0) { // 제목
//				boardSearchList = mainService.boardSearch0(commandMap.getMap());
//			} else if (searchNum == 1) { // 작성자
//				boardSearchList = mainService.boardSearch1(commandMap.getMap());
//			}
//		}
//		return mv;
//	}
//	
//	@RequestMapping(value = "/search0")
//	public ModelAndView selectBoardList(CommandMap commandMap, HttpServletRequest request) throws Exception {
//		ModelAndView mv = new ModelAndView("jsonView");
//
//		isSearch = request.getParameter("isSearch");
//
//		if (isSearch != null ) {
//			searchNum = Integer.parseInt(request.getParameter("searchNum"));
//			commandMap.put("searchNum", searchNum);
//			commandMap.put("isSearch", isSearch);
//			
//			if (searchNum == 0) { // 제목
//				boardSearchList = mainService.boardSearch0(commandMap.getMap());
//			} else if (searchNum == 1) { // 작성자
//				boardSearchList = mainService.boardSearch1(commandMap.getMap());
//			}
//
//			if (boardSearchList.size() > 0) {
//				mv.addObject("TOTAL", boardSearchList.get(0).get("TOTAL_COUNT"));
//			} else {
//				mv.addObject("TOTAL", 0);
//			}
//			
//			mv.addObject("boardSearchList", boardSearchList);
//		} else {
//			if (boardSearchList.size() > 0) {
//				mv.addObject("TOTAL", boardSearchList.get(0).get("TOTAL_COUNT"));
//			} else {
//				mv.addObject("TOTAL", 0);
//			}
//			
//			mv.addObject("boardSearchList", boardSearchList);
//		}
//			return mv;
//	}	
}
