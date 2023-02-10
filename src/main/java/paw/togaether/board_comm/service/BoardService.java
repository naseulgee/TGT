package paw.togaether.board_comm.service;

import java.util.List;
import java.util.Map;

public interface BoardService {
	
	//멍멍왈왈 게시판 리스트 띄우기
	List<Map<String, Object>> boardList(Map<String, Object> map) throws Exception;
	
	//멍멍왈왈 게시판 글쓰기
	void boardWrite(Map<String, Object> map) throws Exception;
	
	//멍멍왈왈 디테일
	Map<String, Object> boardDetail(Map<String, Object> map) throws Exception;
	
	//멍멍왈왈 수정하기
	void boardModify(Map<String, Object> map) throws Exception;
	
	//멍멍왈왈 글 삭제하기
	void boardDelete(Map<String, Object> map) throws Exception;
	
	//멍멍왈왈 카테고리
	List<Map<String, Object>> boardCategory(Map<String, Object> map) throws Exception;
	
	//댓글쓰기
	void commentInsert(Map<String, Object> map) throws Exception;
	
	//댓글조회
	List<Map<String, Object>> commentList(Map<String, Object> map) throws Exception;
	
	//댓글삭제
	void commentDelete(Map<String, Object> map) throws Exception;
	
	//댓글 수정
	void commentModify(Map<String, Object> map) throws Exception;
	
	// 마이페이지 내가 쓴 글 게시판 띄우기
	List<Map<String, Object>> myPageList(Map<String, Object> map) throws Exception;
	
	// 마이페이지 내가 쓴 댓글 띄우기
	List<Map<String, Object>> myPageComment(Map<String, Object> map) throws Exception;
	
	
}