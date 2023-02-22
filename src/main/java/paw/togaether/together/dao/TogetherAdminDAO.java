package paw.togaether.together.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

@Repository("togetherAdminDAO")
public class TogetherAdminDAO extends AbstractDAO {
	
	/* 23.02.01 박선영 관리자 게시글리스트 
	 * 23.02.15 박선영 관리자 게시글 페이징*/
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> togetherAdminList(Map<String, Object> map)throws Exception {
		return (List<Map<String, Object>>) selectPagingList("togetherAdmin.togetherAdminList", map);
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
	
	/* 23.02.06 박선영 관리자 몸무게 리스트 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adminWeightList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("togetherAdmin.adminWeightList", map);
	}
	
	/* 23.02.03 박선영 견종 몸무게 범위 등록 */ 
	public void adminTogeWeight(Map<String, Object> map) throws Exception {
		insert("togetherAdmin.adminTogeWeight", map);
	}
	
	/* 23.02.14 박선영 관리자 게시글 상세보기 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminTogeDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne ("togetherAdmin.adminTogeDetail", map);
	}
	
	/* 23.02.14 박선영 관리자 게시글 삭제 */
	public void adminTogeDel(Map<String, Object> map) throws Exception {
		update("togetherAdmin.adminTogeDel", map);
	}
	
	/* 23.02.15 박선영 관리자 참여멤버 상세보기 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminWithMem(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne ("togetherAdmin.adminWithMem", map);
	}
	
	/* 23.02. 21 박선영 함께해요 카테고리 수정하기 */
	public void adminTogeCateModi(Map<String, Object> map) throws Exception {
		update("togetherAdmin.adminTogeCateModi", map);
	}
	
	/* 23.02.15 박선영 관리자 카테고리 상세보기 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> admiCateDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne ("togetherAdmin.admiCateDetail", map);
	}
	
	/* 23.02.21 박선영 관리자 카테고리 삭제 */ 
	public void adminTogeCateDel(Map<String, Object> map) throws Exception {
		delete("togetherAdmin.adminTogeCateDel", map);
	}
	
	/* 23.02.22 박선영 관리자 몸무게 상세보기 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> adminWeightDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne ("togetherAdmin.adminWeightDetail", map);
	}
	
	/* 23.02. 22 박선영 함께해요 몸무게 수정하기 */
	public void adminTogeWtModi(Map<String, Object> map) throws Exception {
		update("togetherAdmin.adminTogeWtModi", map);
	}
}
