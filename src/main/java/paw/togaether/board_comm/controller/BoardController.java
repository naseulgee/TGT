package paw.togaether.board_comm.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import paw.togaether.board_comm.service.BoardService;
import paw.togaether.common.domain.CommandMap;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	// 멍멍왈왈 게시판 리스트
	@RequestMapping(value = "board_list.paw")
	public ModelAndView boardList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("board_comm/board_list");
		List<Map<String, Object>> list = boardService.boardList(commandMap.getMap());

		mv.addObject("list", list);

		return mv;
	}

	// 멍멍왈왈 게시판 글쓰기 등록
	@RequestMapping(value="board_write.paw")
	public ModelAndView boardWrite(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board_comm/board_write");
		boardService.boardWrite(commandMap.getMap());
		return mv;
	}
	
	//게시글 상세보기
	@RequestMapping(value="board_detail.paw")
	public ModelAndView openBoardDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board_comm/board_detail");
		
		Map<String,Object> map = boardService.boardDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		return mv;
	}
	
	
}
