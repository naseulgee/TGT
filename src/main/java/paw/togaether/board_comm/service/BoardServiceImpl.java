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
	
	@Override
	public void boardWrite(Map<String, Object> map) throws Exception {
		boardDAO.boardWrite(map);
	}
	
	@Override
	public List<Map<String, Object>> boardList(Map<String, Object> map) throws Exception {
		return boardDAO.boardList(map);
	}
	

}
