package paw.togaether.place.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import paw.togaether.common.photo.dao.PhotoDAO;
import paw.togaether.common.util.FileUtils;
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
	
	//파일 저장 및 DB 등록 관련 DAO
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	@Resource(name="photoDAO")
	private PhotoDAO photoDAO;
	
	//시설 관련
	/** 23.01.17 나슬기: 시설 리스트 & 페이징 & 검색 */
	@Override
	public List<Map<String, Object>> placeList(Map<String, Object> map) throws Exception {
		return placeDAO.placeSelectList(map);
	}
	/** 23.01.17 나슬기: 시설 상세
	 * 23.02.01 나슬기: 사진 불러오기 관련 로직 추가 */
	@Override
	public Map<String, Object> placeDetail(Map<String, Object> map) throws Exception {
		map.put("place", placeDAO.placeSelect(map));
		map.put("photos", photoDAO.selectMyPhoto(map));
		return map;
	}
	/** 23.01.17 나슬기: 시설 글쓰기
	 * 23.01.26 나슬기: 사진 등록 관련 로직 추가 */
	@Override
	public int placeWrite(Map<String, Object> map, HttpSession session, MultipartFile[] uploadFile) throws Exception {
		int result = placeDAO.placeInsert(map);
		//사진등록 및 사진저장, 썸네일저장
		map.put("idx", map.get("PL_IDX_NEXT"));
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, session, uploadFile);
		for(int i=0, size=list.size(); i<size; i++) {
			photoDAO.insertPhoto(list.get(i));
		}
		return result;
	}
	/** 23.01.17 나슬기: 시설 수정
	 * 23.02.01 나슬기: 사진 수정 관련 로직 추가 */
	@Override
	public int placeModify(Map<String, Object> map, HttpSession session, MultipartFile[] uploadFile) throws Exception {
		Map<String, Object> cm = (Map<String, Object>)map.get("map");
		map.put("pl_idx", cm.get("pl_idx"));
		map.put("idx", cm.get("pl_idx"));

		photoDAO.deletePhoto(map);//리뷰관련 사진 일단 전부 삭제 (re_del_gb='Y')
		
		List<String> or_photos = new ArrayList<String>();
		//기존 사진 업데이트해주기
		for (String key : cm.keySet()) {
			Map<String,Object> photoMap = new HashMap<String,Object>();
			if ((key.length()>=5) && key.substring(0, 4).equals("idx_")) {
				photoMap.put("ph_idx",cm.get(key));//photo번호를 통해 ph_del_gb='N'로 변경
				photoDAO.updatePhoto(photoMap);
				or_photos.add(key);
			}
		}
		//새로운 사진 있으면 저장
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, session, uploadFile);
		for(int i=0; i<list.size(); i++) {
			photoDAO.insertPhoto(list.get(i));
		}
		
		//기존 사진 키값 제거
		for (int i = 0; i < or_photos.size(); i++) {
			cm.remove(or_photos.get(i));
		}
		map.put("map", cm);
		int result = placeDAO.placeUpdate(map);
		return result;
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