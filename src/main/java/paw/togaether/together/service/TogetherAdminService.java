package paw.togaether.together.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface TogetherAdminService {
	
	/* 23.02.01 관리자 함께해요 게시글 리스트보기 */
	List<Map<String, Object>> togetherAdminList(Map<String, Object> map) throws Exception;
	
	/* 23.01.25 박선영 관리자 분류 등록
	 * 23.02.01 박선영 관리자 분리 */
	void adminTogeCateWrite(Map<String, Object> map) throws Exception;
	
	/* 23.02.01 박선영 관리자 카테고리별 게시글 리스트 */
	List<Map<String, Object>> togetherAdminCateList(Map<String, Object> map) throws Exception;
	
	/* 23.02.01 박선영 관리자 견종분류리스트 */
	List<Map<String, Object>> togetherAdminbreed(Map<String, Object> map) throws Exception;
	
	/* 23.02.01 박선영 관리자 참여자 리스트 */
	List<Map<String, Object>> togetherAdminWithList(Map<String, Object> map) throws Exception;
	
	/* 23.02.01 박선영 관리자 카테고리 리스트 */
	List<Map<String, Object>> togetherAdminCate(Map<String, Object> map) throws Exception;
	
	/* 23.02.06 박선영 관리자 몸무게 리스트 */
	List<Map<String, Object>> adminWeightList(Map<String, Object> map) throws Exception;
	
	/* 23.02.03 박선영 관리자 견종 몸무게 작성 */
	void adminTogeWeight(Map<String, Object> map) throws Exception;

}
