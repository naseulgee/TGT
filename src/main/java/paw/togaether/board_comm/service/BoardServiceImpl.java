package paw.togaether.board_comm.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import paw.togaether.board_comm.dao.BoardDAO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
	// 멍멍왈왈 게시판 리스트 띄우기
	@Override
	public List<Map<String, Object>> boardList(Map<String, Object> map) throws Exception {
		return boardDAO.boardList(map);
	}
	
	//멍멍왈왈 게시판 글쓰기
	@Override
	public void boardWrite(Map<String, Object> map) throws Exception {
		boardDAO.boardWrite(map);
	}
	
	//멍멍왈왈 디테일
	@Override
	public Map<String, Object> boardDetail(Map<String, Object> map) throws Exception {
		boardDAO.boardHit(map);
		Map<String, Object> resultMap = boardDAO.boardDetail(map);
		return resultMap;
	}
	
	//멍멍왈왈 수정하기
	@Override
	public void boardModify(Map<String ,Object> map) throws Exception {
		boardDAO.boardModify(map);
	}
	
	//멍멍왈왈 글 삭제하기
	@Override
	public void boardDelete(Map<String ,Object> map) throws Exception {
		boardDAO.boardDelete(map);
	}
	
	//멍멍왈왈 카테고리
	@Override
	public List<Map<String, Object>> boardCategory(Map<String, Object> map) throws Exception {
		return boardDAO.boardCategory(map);
	}
	
	
	//댓글쓰기
	@Override
	public void commentInsert(Map<String, Object> map) throws Exception {
		boardDAO.commentInsert(map);
	}
	
	// 댓글 조회
	@Override
	public List<Map<String, Object>> commentList(Map<String, Object> map) throws Exception {
		return boardDAO.commentList(map);
	}
	
	//댓글 삭제
	@Override
	public void commentDelete(Map<String ,Object> map) throws Exception {
		boardDAO.commentDelete(map);
	}
	
	// 멍멍왈왈 수정하기
	@Override
	public void commentModify(Map<String, Object> map) throws Exception {
		boardDAO.commentModify(map);
	}

	// 마이페이지 내가 쓴 글 게시판 띄우기
	@Override
	public List<Map<String, Object>> myPageList(Map<String, Object> map) throws Exception {
		return boardDAO.myPageList(map);
	}
	
	// 마이페이지 내가 쓴 댓글 띄우기
	@Override
	public List<Map<String, Object>> myPageComment(Map<String, Object> map) throws Exception {
		return boardDAO.myPageComment(map);
	}
		
	
}
