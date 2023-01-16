package paw.togaether.board_comm.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import paw.togaether.board_comm.service.BoardService;
import paw.togaether.common.domain.CommandMap;



@Log4j
@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	/* 23.01.12 최선아: 멍멍왈왈 게시판 리스트, 등록, 상세보기
	 * 23.01.13 최선아: 멍멍왈왈 게시판 수정 */
	
	// 멍멍왈왈 게시판 리스트
	@RequestMapping(value = "/board/list")
	public ModelAndView boardList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("board_comm/board_list");
		List<Map<String, Object>> list = boardService.boardList(commandMap.getMap());

		mv.addObject("list", list); //글번호,제목,조회수,작성자,작성날짜 담아줌

		return mv;
	}

	// 멍멍왈왈 게시판 글 등록폼
	@RequestMapping(value="/board/writeForm")
	public ModelAndView boardWriteForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board_comm/board_write");
		return mv;
	}
	
	// 멍멍왈왈 게시판 글 등록
	@RequestMapping(value = "/board/write")
	public ModelAndView boardWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/board/list.paw");
	    boardService.boardWrite(commandMap.getMap());
		return mv;
	}
	
	//게시글 상세보기
	@RequestMapping(value="/board/detail")
	public ModelAndView BoardDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board_comm/board_detail");
		log.fatal("Controller>detail>getmap():"+commandMap.getMap());
		Map<String,Object> map = boardService.boardDetail(commandMap.getMap());
		mv.addObject("map", map);
		log.fatal("Controller>detail>returned map:"+map);
		return mv;
	}
	
	
	//게시글 수정하기폼
	@RequestMapping(value="/board/modifyForm")
	public ModelAndView boardModifyForm(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/board_comm/board_modify");
		
		log.info("getmap()"+commandMap.getMap());
		Map<String,Object> map = boardService.boardDetail(commandMap.getMap());
		log.info("returned map"+map);
		mv.addObject("map", map);
		
		
		return mv;
	}
	
	// 게시글 수정하기
	@RequestMapping(value = "/board/modify", method = RequestMethod.POST)
	public ModelAndView boardModify(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/board/list.paw");

		boardService.boardModify(commandMap.getMap());
		mv.addObject("BC_IDX", commandMap.get("BC_IDX"));

		return mv;
	}
	 
	
	//게시글 삭제하기
	@RequestMapping(value = "/board/delete", method = RequestMethod.POST )
	public ModelAndView boardDelete(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/board/list.paw");
		
		boardService.boardDelete(commandMap.getMap());

		return mv;
	}
	

}
