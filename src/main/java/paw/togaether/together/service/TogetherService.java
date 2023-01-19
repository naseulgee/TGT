package paw.togaether.together.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface TogetherService {
	
	//함께해요 게시판 페이징 리스트 & 검색 메소드, togetherList 메소드
	/*
	 * Map<String, Object> togetherList(Map<String, Object> map) throws Exception;
	 */
	
	//함께해요 게시글 리스트
	List<Map<String, Object>> togetherList(Map<String, Object> map) throws Exception;
	
	//함께해요 게시글 작성
	void togetherWrite(Map<String, Object> map) throws Exception;
	
	/* 23.01.18 박선영 함께해요 게시글 상세보기 */ 
	Map<String, Object> togetherDetail(Map<String, Object> map) throws Exception;
	
	/* 23.01.19 박선영 함께해요 게시글 카테고리별 리스트 */ 
	List<Map<String, Object>> togetherCateList(Map<String, Object> map) throws Exception;
}
