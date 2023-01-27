package paw.togaether.place.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public interface PlaceService {
	//시설 리스트 & 페이징 & 검색
	Map<String, Object>placeList(Map<String, Object> map) throws Exception;
	//시설 상세
	Map<String, Object>placeDetail(Map<String, Object> map) throws Exception;
	//시설 글쓰기
	int placeWrite(Map<String, Object> map, HttpSession session, MultipartFile[] uploadFile) throws Exception;
	//시설 수정
	int placeModify(Map<String, Object> map, HttpSession session, MultipartFile[] uploadFile) throws Exception;
	//시설 삭제 요청
	int placeDeleteReq(Map<String, Object> map) throws Exception;
	//시설 삭제
	int placeDelete(Map<String, Object> map) throws Exception;
	
	//시설 카테고리 리스트
	List<Map<String, Object>>cateList(Map<String, Object> map) throws Exception;
	//시설 카테고리 글쓰기
	int cateWrite(Map<String, Object> map) throws Exception;
	//시설 카테고리 수정
	int cateModify(Map<String, Object> map) throws Exception;
	//시설 카테고리 삭제
	int cateDelete(Map<String, Object> map) throws Exception;
	
	//시설 메뉴 리스트
	List<Map<String, Object>>menuList(Map<String, Object> map) throws Exception;
	//시설 메뉴 글쓰기
	int menuWrite(Map<String, Object> map) throws Exception;
	//시설 메뉴 수정
	int menuModify(Map<String, Object> map) throws Exception;
	//시설 메뉴 삭제
	int menuDelete(Map<String, Object> map) throws Exception;
}