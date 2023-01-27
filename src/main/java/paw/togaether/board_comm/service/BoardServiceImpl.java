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
	
	
}
