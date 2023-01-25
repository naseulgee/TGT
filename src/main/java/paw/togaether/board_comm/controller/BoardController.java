package paw.togaether.board_comm.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;
import paw.togaether.board_comm.service.BoardService;
import paw.togaether.common.domain.CommandMap;



@Log4j
@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;


	/* 
	 * 23.01.12 최선아: 멍멍왈왈 게시판 리스트, 등록, 상세보기
	 * 23.01.13 최선아: 멍멍왈왈 게시판 수정 
	 * 23.01.16 최선아: 멍멍왈왈 게시판 삭제
	 * 23.01.17 최선아: 멍멍왈왈 게시판 등록 후 알러창 띄우기
	 * 23.01.19 최선아: 멍멍왈왈 게시판 카테고리
	 * 23.01.25 최선아: 멍멍왈왈 댓글처리
	 * */
	
	
	// 멍멍왈왈 게시판 리스트
	@RequestMapping(value = "/board/list", method=RequestMethod.GET)
	public ModelAndView boardList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("board_comm/board_list");
		List<Map<String, Object>> list = boardService.boardList(commandMap.getMap());
		  
		mv.addObject("list", list); //글번호,제목,조회수,작성자,작성날짜 담아줌
		return mv;
	}

	// 멍멍왈왈 게시판 리스트
	@RequestMapping(value = "/board/list2.paw", method=RequestMethod.POST)
	public ModelAndView boardList2(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("board_comm/board_list2");
		Map<String, Object> map = commandMap.getMap();
		if (map.get("BC_BCC_NAME").equals("전체게시판")){
			map.remove("BC_BCC_NAME");
		};
		List<Map<String, Object>> list = boardService.boardList(map);
		log.info("BoadList2=============="+map);
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
	@RequestMapping(value = "/board/write")//RedirectAttributes 클래스를 이용해 등록 후 alert창 띄우기 
	public ModelAndView boardWrite(CommandMap commandMap, RedirectAttributes redirect) throws Exception {
		//RedirectAttributes에 String 문자열을 전달 할 수 있음
		ModelAndView mv = new ModelAndView("redirect:/board/list.paw");
		
	    boardService.boardWrite(commandMap.getMap());
	    
	    redirect.addFlashAttribute("success", "글 작성이 완료되었습니다.");
	    //addFlashAttribute 경우 데이터가 post방식으로 전달해줌. 한번만 사용 할 수 있는 휘발성임
		return mv;
	}
	
	//게시글 상세보기
	@RequestMapping(value="/board/detail")
	public ModelAndView BoardDetail(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board_comm/board_detail");
		
		log.fatal("Controller>detail>getmap():"+commandMap.getMap());
		
		Map<String,Object> map = boardService.boardDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		List<Map<String, Object>> comment = boardService.commentList(commandMap.getMap());
		mv.addObject("comment", comment);
		
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
	@RequestMapping(value = "/board/modify", method = RequestMethod.POST)//RedirectAttributes 클래스를 이용해 수정 후 alert창 띄우기 
	public ModelAndView boardModify(CommandMap commandMap, RedirectAttributes redirect) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/board/list.paw");

		boardService.boardModify(commandMap.getMap());
		mv.addObject("BC_IDX", commandMap.get("BC_IDX"));
		redirect.addFlashAttribute("info", "글 수정이 완료되었습니다.");

		return mv;
	}
	 
	
	//게시글 삭제하기
	@RequestMapping(value = "/board/delete", method = RequestMethod.POST )//RedirectAttributes 클래스를 이용해 삭제 후 alert창 띄우기 
	public ModelAndView boardDelete(CommandMap commandMap, RedirectAttributes redirect) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/board/list.paw");
		
		boardService.boardDelete(commandMap.getMap());
		redirect.addFlashAttribute("warning", "글 삭제가 완료되었습니다.");
		return mv;
	}
	
	// 멍멍왈왈 게시판 댓글 등록
	@RequestMapping(value = "/comment/write", method = RequestMethod.POST)
	public ModelAndView commentInsert(CommandMap commandMap, RedirectAttributes redirect) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/board/list.paw");
		
		boardService.commentInsert(commandMap.getMap());
		
		return mv;
	}
	
	
	
	
}
