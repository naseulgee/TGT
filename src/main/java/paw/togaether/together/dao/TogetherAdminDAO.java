package paw.togaether.together.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

@Repository("togetherAdminDAO")
public class TogetherAdminDAO extends AbstractDAO {
	
	/* 23.02.01 박선영 관리자 게시글리스트 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> togetherAdminList(Map<String, Object> map)throws Exception {
		return (List<Map<String, Object>>) selectList("togetherAdmin.togetherAdminList", map);
	}
	
	/* 23.01.25 박선영 관리자 카테고리 등록
	 * 23.02.01 박선영 관리자 분리 */
	public void adminTogeCateWrite(Map<String, Object> map) throws Exception {
		insert("togetherAdmin.adminTogeCateWrite", map);
	} 
	
	/* 23.01.19 박선영 : 함께해요 게시글 카테고리별 리스트 출력 
	 * 23.02.01 박선영 : 관리자 페이지 분리*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> togetherAdminCateList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("togetherAdmin.togetherAdminCateList", map);
	}
	
	/* 23.02.01 박선영 관리자 견종분류 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> togetherAdminbreed(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("togetherAdmin.togetherAdminbreed", map);
	}
	
	/* 23.02.01 박선영 관리자 참여자 리스트 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> togetherAdminWithList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("togetherAdmin.togetherAdminWithList", map);
	}
	
	/* 23.02.01 박선영 관리자 카테고리 리스트 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> togetherAdminCate(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("togetherAdmin.togetherAdminCate", map);
	}
	
}
