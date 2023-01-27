package paw.togaether.place.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import paw.togaether.place.dao.PlaceCateDAO;
import paw.togaether.place.dao.PlaceDAO;
import paw.togaether.place.dao.PlaceMenuDAO;

/** 23.01.17 나슬기: 시설, 시설 카테고리, 시설 메뉴 관련 모든 작업을 처리하는 클래스 */
@Service("placeService")
public class PlaceServiceImpl implements PlaceService {
	Logger log = Logger.getLogger(this.getClass());

	//시설, 시설 카테고리, 시설 메뉴 관련 DAO
	@Resource(name="placeDAO")
	private PlaceDAO placeDAO;
	@Resource(name="placeCateDAO")
	private PlaceCateDAO placeCateDAO;
	@Resource(name="placeMenuDAO")
	private PlaceMenuDAO placeMenuDAO;
	
	//시설 관련
	/** 23.01.17 나슬기: 시설 리스트 & 페이징 & 검색 */
	@Override
	public Map<String, Object> placeList(Map<String, Object> map) throws Exception {
		return placeDAO.placeSelectList(map);
	}
	/** 23.01.17 나슬기: 시설 상세 */
	@Override
	public Map<String, Object> placeDetail(Map<String, Object> map) throws Exception {
		return placeDAO.placeSelect(map);
	}
	/** 23.01.17 나슬기: 시설 글쓰기 */
	@Override
	public int placeWrite(Map<String, Object> map) throws Exception {
		return placeDAO.placeInsert(map);
	}
	/** 23.01.17 나슬기: 시설 수정 */
	@Override
	public int placeModify(Map<String, Object> map) throws Exception {
		return placeDAO.placeUpdate(map);
	}
	/** 23.01.17 나슬기: 시설 삭제 요청 */
	@Override
	public int placeDeleteReq(Map<String, Object> map) throws Exception {
		return placeDAO.placeDeleteReq(map);
	}
	/** 23.01.17 나슬기: 시설 삭제 */
	@Override
	public int placeDelete(Map<String, Object> map) throws Exception {
		return placeDAO.placeDelete(map);
	}

	//시설 카테고리 관련
	/** 23.01.17 나슬기: 시설 카테고리 리스트 */
	@Override
	public List<Map<String, Object>> cateList(Map<String, Object> map) throws Exception {
		return placeCateDAO.cateSelectList(map);
	}
	/** 23.01.17 나슬기: 시설 카테고리 글쓰기 */
	@Override
	public int cateWrite(Map<String, Object> map) throws Exception {
		return placeCateDAO.cateInsert(map);
	}
	/** 23.01.17 나슬기: 시설 카테고리 수정 */
	@Override
	public int cateModify(Map<String, Object> map) throws Exception {
		return placeCateDAO.cateUpdate(map);
	}
	/** 23.01.17 나슬기: 시설 카테고리 삭제 */
	@Override
	public int cateDelete(Map<String, Object> map) throws Exception {
		return placeCateDAO.cateDelete(map);
	}

	//시설 메뉴 관련
	/** 23.01.17 나슬기: 시설 메뉴 리스트 */
	@Override
	public List<Map<String, Object>> menuList(Map<String, Object> map) throws Exception {
		return placeMenuDAO.menuSelectList(map);
	}
	/** 23.01.17 나슬기: 시설 메뉴 글쓰기 */
	@Override
	public int menuWrite(Map<String, Object> map) throws Exception {
		return placeMenuDAO.menuInsert(map);
	}
	/** 23.01.17 나슬기: 시설 메뉴 수정 */
	@Override
	public int menuModify(Map<String, Object> map) throws Exception {
		return placeMenuDAO.menuUpdate(map);
	}
	/** 23.01.17 나슬기: 시설 메뉴 삭제 */
	@Override
	public int menuDelete(Map<String, Object> map) throws Exception {
		return placeMenuDAO.menuDelete(map);
	}
}