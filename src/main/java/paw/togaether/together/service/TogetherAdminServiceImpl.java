package paw.togaether.together.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import paw.togaether.together.dao.TogetherAdminDAO;

@Service("togetherAdminService")
public class TogetherAdminServiceImpl implements TogetherAdminService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="togetherAdminDAO")
	private TogetherAdminDAO togetherAdminDAO;
	
	/* 23.02.01 박선영 관리자 함께해요 게시글리스트 */
	@Override
	public List<Map<String, Object>> togetherAdminList(Map<String, Object> map) throws Exception {
		return togetherAdminDAO.togetherAdminList(map);
	}
	
	/* 23.01.25 박선영 관리자 카테고리 등록
	 * 23.02.01 박선영 관리자 분리 */
	@Override
	public void adminTogeCateWrite(Map<String, Object> map) throws Exception {
		togetherAdminDAO.adminTogeCateWrite(map);
	}
	
	/* 23.02.01 박선영 관리자 함께해요 카테고리별 리스트 출력 */
	@Override
	public List<Map<String, Object>> togetherAdminCateList(Map<String, Object> map) throws Exception {
		return togetherAdminDAO.togetherAdminCateList(map);
	}
	
	/* 23.02.01 박선영 관리자 견종리스트 */
	@Override
	public List<Map<String, Object>> togetherAdminbreed(Map<String, Object> map) throws Exception {
		return togetherAdminDAO.togetherAdminbreed(map);
	}
	
	/* 23.02.01 박선영 관리자 참여자 리스트 */
	@Override
	public List<Map<String, Object>> togetherAdminWithList(Map<String, Object> map) throws Exception {
		return togetherAdminDAO.togetherAdminWithList(map);
	}
	
	/* 23.02.01 박선영 관리자 카테고리 리스트 */
	@Override
	public List<Map<String, Object>> togetherAdminCate(Map<String, Object> map) throws Exception {
		return togetherAdminDAO.togetherAdminCate(map);
	}
	
	/* 23.02.06 박선영 관리자 몸무게 리스트 */
	@Override
	public List<Map<String, Object>> adminWeightList(Map<String, Object> map) throws Exception {
		return togetherAdminDAO.adminWeightList(map);
	}
	
	/* 23.02.03 박선영 관리자 견종몸무게 등록 */
	@Override
	public void adminTogeWeight(Map<String, Object> map) throws Exception {
		togetherAdminDAO.adminTogeWeight(map);
	}
	
	/* 23.02.14 박선영 관리자 게시글 상세보기 */
	@Override
	public Map<String, Object> adminTogeDetail (Map<String, Object> map) throws Exception {
		return togetherAdminDAO.adminTogeDetail(map);
	}
	
	/* 23.02.14 박선영 관리자 게시글 삭제 */
	@Override
	public void adminTogeDel(Map<String, Object> map) throws Exception {
		togetherAdminDAO.adminTogeDel(map);
	}
	
	/* 23.02.15 박선영 관리자 참여멤버 상세보기 */
	@Override
	public Map<String, Object> adminWithMem (Map<String, Object> map) throws Exception {
		return togetherAdminDAO.adminWithMem(map);
	}
	
	/* 23.02.21 박선영 관리자 카테고리 수정  */
	@Override
	public void adminTogeCateModi(Map<String, Object> map) throws Exception {
		togetherAdminDAO.adminTogeCateModi(map);
	}
	
	/* 23.02.21 박선영 관리자 카테고리 상세보기 */
	@Override
	public Map<String, Object> admiCateDetail (Map<String, Object> map) throws Exception {
		return togetherAdminDAO.admiCateDetail(map);
	}
	
	/* 23.02.21 박선영 관리자 카테고리 삭제 */
	@Override
	public void adminTogeCateDel(Map<String, Object> map) throws Exception {
		togetherAdminDAO.adminTogeCateDel(map);
	}
	
	/* 23.02.22 박선영 관리자 몸무게 상세보기 */
	@Override
	public Map<String, Object> adminWeightDetail (Map<String, Object> map) throws Exception {
		return togetherAdminDAO.adminWeightDetail(map);
	}
	
	/* 23.02.22 박선영 관리자 몸무게 수정  */
	@Override
	public void adminTogeWtModi(Map<String, Object> map) throws Exception {
		togetherAdminDAO.adminTogeWtModi(map);
	}
}
