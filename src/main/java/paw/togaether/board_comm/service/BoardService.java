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
	
}
