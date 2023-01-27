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
	
	/* 23.01.20 박선영 함께해요 게시글 수정 */
	void togetherModi(Map<String, Object> map) throws Exception;
	
	/* 23.01.20 박선영 견종분류 */
	List<Map<String, Object>> togetherbreed(Map<String, Object> map) throws Exception;
	
	/* 23.01.21 박선영 참여자 리스트 */
	List<Map<String, Object>> togetherWithList(Map<String, Object> map) throws Exception;
	
	/* 23.01.23 박선영 게시글 삭제 */
	void togetherDel(Map<String, Object> map) throws Exception;
	
	/* 23.01.25 박선영 게시글 카테고리리스트 */
	List<Map<String, Object>> togetherCate(Map<String, Object> map) throws Exception;
	
	/* 23.01.25 박선영 관리자 분류 등록 */
	void adminTogeCateWrite(Map<String, Object> map) throws Exception;
	
	/* 23.01.25 박선영 참여인원 카운트 */
	int togetherJoinCount(Map<String, Object> map) throws Exception;
	
}
