package paw.togaether.together.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

@Repository("togetherDAO")
public class TogetherDAO extends AbstractDAO {
	
	/* 함께해요 게시판 페이징 리스트 출력 & 검색기능 */
	
	/*
	 * @SuppressWarnings("unchecked") public Map<String,
	 * Object>togetherList(Map<String, Object> map) throws Exception{
	 * return(Map<String, Object>)selectPagingList("together.togetherList", map); }
	 */
	
	/* 함께해요 게시판 리스트 출력&검색기능 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> togetherList(Map<String, Object> map)throws Exception {
		return (List<Map<String, Object>>) selectList("together.togetherList", map);
	}
	
	/*
	 * 함께해요 게시글 작성 insert 메소드는 return 형태가 없어서 void로 표현*/
	public void togetherWrite(Map<String, Object> map) throws Exception {
		insert("together.togetherWrite", map);
	}
	
	/* 23.01.18 박선영: 함께해요 게시글 상세보기 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> togetherDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("together.togetherDetail", map);
	}
	
	/* 23.01.19 박선영 : 함께해요 게시글 카테고리별 리스트 출력 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> togetherCateList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("together.togetherCateList", map);
	}
	
	/* 23.01.20 박선영 함께해요 게시글 수정하기 */
	public void togetherModi(Map<String, Object> map) throws Exception {
		update("together.togetherModi", map);
	}
	
	/* 23.01.21 박선영 견종분류 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> togetherbreed(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("together.togetherbreed", map);
	}
	
	/* 23.01.21 박선영 참여자 리스트 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> togetherWithList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("together.togetherWithList", map);
	}
	
	/* 23.01.23 박선영 게시글 삭제하기 */
	public void togetherDel(Map<String, Object> map) throws Exception {
		update("together.togetherDel", map);
	}
	
	/* 23.01.25 박선영 카테고리 분류리스트 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> togetherCate(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("together.togetherCate", map);
	}
	
	/* 23.01.25 박선영 관리자 카테고리 등록 */
	public void adminTogeCateWrite(Map<String, Object> map) throws Exception {
		insert("together.adminTogeCateWrite", map);
	} 
	
	/* 23.01.25 박선영 참여인원 수 */
	public int togetherJoinCount(Map<String, Object> map) throws Exception {
		return (int) selectOne("together.togetherJoinCount", map);
	}

}
