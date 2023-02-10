package paw.togaether.board_comm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;
import paw.togaether.board_comm.service.BoardService;
import paw.togaether.common.domain.CommandMap;
import paw.togaether.main.service.MainService;



@Log4j
@Controller
public class BoardController {
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	@Resource(name = "mainService")
	private MainService mainService;

	/* 
	 * 23.01.12 최선아: 멍멍왈왈 게시판 리스트, 등록, 상세보기
	 * 23.01.13 최선아: 멍멍왈왈 게시판 수정 
	 * 23.01.16 최선아: 멍멍왈왈 게시판 삭제
	 * 23.01.17 최선아: 멍멍왈왈 게시판 등록 후 알러창 띄우기
	 * 23.01.19 최선아: 멍멍왈왈 게시판 카테고리
	 * 23.01.25 최선아: 멍멍왈왈 댓글 등록, 조회
	 * 23.01.27 최선아: 게시판 댓글 삭제
	 * 23.01.30 최선아: 게시판 댓글 수정
	 * 23.02.01 최선아: 게시판 전체 검색 및 페이징
	 * */
	
	
	// 멍멍왈왈 게시판 띄워주기만 하는 리스트
	@RequestMapping(value = "/board/list", method = RequestMethod.GET)
	public ModelAndView boardList(CommandMap commandMap, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("board_comm/board_list");
		
		return mv;
	}

	
	//페이징 리스트2 페이징 처리
	@RequestMapping(value="/pagingBoard/list")
	public ModelAndView selectBoardList(CommandMap commandMap) throws Exception{
		
		ModelAndView mv = new ModelAndView("jsonView");
				
		List<Map<String,Object>> list = boardService.boardList(commandMap.getMap());
		mv.addObject("list", list);

		//페이징 처리
		if(list.size() > 0){
			mv.addObject("TOTAL_B", list.get(0).get("TOTAL_COUNT"));
		}
		else{
			mv.addObject("TOTAL_B", 0);
		}
	
		return mv;
	}
	
	// 멍멍왈왈 게시판 글 등록폼
	@RequestMapping(value = "/board/writeForm")
	public ModelAndView boardWriteForm(CommandMap commandMap, HttpSession session) throws Exception {
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
	@RequestMapping(value="/board/detail/{BC_IDX}")
	public ModelAndView BoardDetail(@PathVariable("BC_IDX") int BC_IDX, CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/board_comm/board_detail");
		
		System.out.println(BC_IDX);
		commandMap.put("BC_IDX", BC_IDX); //댓글 수정쪽 바로 게시글 번호를 받아와야해서 넣어줌
		
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
	
	// 댓글 등록
	@RequestMapping(value = "/comment/write", method = RequestMethod.POST)
	public ModelAndView commentInsert(CommandMap commandMap, RedirectAttributes redirect,  HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("board_comm/board_detail");
		System.out.println("mem_id :" + session.getAttribute("mem_id"));
		boardService.commentInsert(commandMap.getMap());
		
		return mv;
	}
	
	//댓글 삭제
	@RequestMapping(value = "/comment/delete", method = RequestMethod.POST )
	public ModelAndView commentDelete(CommandMap commandMap, RedirectAttributes redirect) throws Exception {
		
		ModelAndView mv = new ModelAndView("board_comm/board_detail");
		boardService.commentDelete(commandMap.getMap());
		redirect.addFlashAttribute("info", "댓글 삭제가 완료되었습니다.");
		
		return mv;
	}
	
	
	//댓글 수정하기
	@RequestMapping(value = "/comment/modify", method = RequestMethod.POST) 
	public ModelAndView commentModify(CommandMap commandMap, RedirectAttributes redirect) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/board/detail/{BC_IDX}.paw"); 
		
		boardService.commentModify(commandMap.getMap());
		redirect.addAttribute("BC_IDX", commandMap.get("BC_IDX"));  //댓글 수정 후 게시글 번호 자동으로 가져와야해서 넣어줌
		
		return mv;
	}
	
	// 마이페이지에서 내가 쓴 게시글 보기
	@RequestMapping(value = "/mypage/board/list")
	public ModelAndView myPageList(CommandMap commandMap, HttpSession session, RedirectAttributes redirect) throws Exception {
		ModelAndView mv = new ModelAndView("/mypage/board_comm/list");
		
		String mem_id = (String)session.getAttribute("mem_id"); //세션 아이디가져오기
		commandMap.put("mem_id", mem_id); // 세션 커맨드맵에 넣어주기
		
		List<Map<String,Object>> myPageList = boardService.myPageList(commandMap.getMap());
		mv.addObject("myPageList", myPageList);
		mv.addObject("mem_id", session.getAttribute("mem_id"));
		List<Map<String,Object>> myPageComment = boardService.myPageComment(commandMap.getMap());  //댓글 리스트 가져오기
		
		redirect.addAttribute("BC_IDX", commandMap.get("BC_IDX")); 
		mv.addObject("myPageComment", myPageComment);
		
		
		log.info("mem_id" + commandMap.getMap());	
		
		return mv;
	}
	
	
}
