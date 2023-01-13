package paw.togaether.together.service;

import java.util.List;
import java.util.Map;

public interface TogetherService {
	
	//함께해요 게시판 페이징 리스트 & 검색 메소드, togetherList 메소드
	/*
	 * Map<String, Object> togetherList(Map<String, Object> map) throws Exception;
	 */
	
	//함께해요 리스트
	List<Map<String, Object>> togetherList(Map<String, Object> map) throws Exception;

}
