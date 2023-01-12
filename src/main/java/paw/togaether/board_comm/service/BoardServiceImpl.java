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
	
	//리스트
	@Override
	public List<Map<String, Object>> boardList(Map<String, Object> map) throws Exception {
		return boardDAO.boardList(map);
	}
	
	//등록
	@Override
	public void boardWrite(Map<String, Object> map) throws Exception {
		boardDAO.boardWrite(map);
	}
	
	//게시글 상세보기
	@Override
	public Map<String, Object> boardDetail(Map<String, Object> map) throws Exception {
		boardDAO.boardHit(map);
		Map<String, Object> resultMap = boardDAO.boardDetail(map);
		return resultMap;
	}
	
}
