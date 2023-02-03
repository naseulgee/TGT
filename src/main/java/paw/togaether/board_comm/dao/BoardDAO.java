package paw.togaether.board_comm.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {
	
	// 멍멍왈왈 게시판 리스트 띄우기
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> boardList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("Board.boardList", map);
		
	}
	
	//멍멍왈왈 게시판 글쓰기
	public void boardWrite(Map<String, Object> map) throws Exception {
		insert("Board.boardWrite", map);
	}
	
	//멍멍왈왈 디테일
	@SuppressWarnings("unchecked")
	public Map<String, Object> boardDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("Board.boardDetail", map);
	}
	
	//멍멍왈왈 수정하기
	public void boardModify(Map<String, Object> map) throws Exception {
		update("Board.boardModify", map);
	}
	
	// 멍멍왈왈 조회수
	public void boardHit(Map<String, Object> map) throws Exception {
		update("Board.boardHit", map);
	}
	
	//멍멍왈왈 글 삭제하기
	public void boardDelete(Map<String, Object> map) throws Exception {
		update("Board.boardDelete", map);
	}
	
	//멍멍왈왈 카테고리
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> boardCategory(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("Board.boardCategory", map);
	}
	
	//댓글쓰기
	public void commentInsert(Map<String, Object> map) throws Exception {
		insert("Board.commentInsert", map);
	}
	
	//댓글 조회
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> commentList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("Board.commentList", map);
	}
	
	// 댓글 삭제
	public void commentDelete(Map<String, Object> map) throws Exception {
		update("Board.commentDelete", map);
	}
		
	// 멍멍왈왈 수정하기
	public void commentModify(Map<String, Object> map) throws Exception {
		update("Board.commentModify", map);
	}
	
	
	
}
