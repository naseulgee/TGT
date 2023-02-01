package paw.togaether.place.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

/** 23.01.17 나슬기: place_SQL.xml과 맵핑되는 DAO 클래스 */
@Repository("placeDAO")
public class PlaceDAO extends AbstractDAO {
	/** 23.01.17 나슬기: 시설 리스트 조회 메소드 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> placeSelectList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectPagingList("place.se_pl_list", map);
	}
	/** 23.01.17 나슬기: 시설 상세 조회 메소드 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> placeSelect(Map<String, Object> map) throws Exception{
		return (Map<String, Object>)selectOne("place.se_pl", map);
	}
	
	/** 23.01.17 나슬기: 시설 추가 메소드 */
	public int placeInsert(Map<String, Object> map) throws Exception{
		return Integer.parseInt(insert("place.in_pl", map).toString());
	}
	
	/** 23.01.17 나슬기: 시설 수정 메소드 */
	public int placeUpdate(Map<String, Object> map) throws Exception{
		return Integer.parseInt(update("place.up_pl", map).toString());
	}
	
	/** 23.01.17 나슬기: 시설 삭제 요청 메소드 */
	public int placeDeleteReq(Map<String, Object> map) throws Exception{
		return Integer.parseInt(update("place.de_req_pl", map).toString());
	}
	/** 23.01.17 나슬기: 시설 삭제 메소드 */
	public int placeDelete(Map<String, Object> map) throws Exception{
		return Integer.parseInt(delete("place.de_pl", map).toString());
	}
}