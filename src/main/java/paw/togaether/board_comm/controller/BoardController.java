package paw.togaether.board_comm.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import paw.togaether.board_comm.service.BoardService;
import paw.togaether.common.domain.CommandMap;

@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	
	//리스트 띄우기
	@RequestMapping(value="board_list.paw")
    public ModelAndView boardList(Map<String, Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("board_comm/board_list");
    	
    	List<Map<String,Object>> list = boardService.boardList(commandMap);
    	mv.addObject("list", list);
    	
    	return mv;
    }
	
	
	// 게시판 글쓰기
	@RequestMapping(value = "/board/boardWrite")
	public ModelAndView boardWrite(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		boardService.boardWrite(commandMap.getMap());
		return mv;
	}
	
	
}
