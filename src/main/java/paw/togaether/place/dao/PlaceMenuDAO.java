package paw.togaether.place.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

/** 23.01.17 나슬기: place_menu_SQL.xml과 맵핑되는 DAO 클래스 */
@Repository("placeMenuDAO")
public class PlaceMenuDAO extends AbstractDAO {
	/** 23.01.17 나슬기: 시설 메뉴 조회 메소드. 페이징 처리는 하지 않는다. */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> menuSelectList(Map<String, Object> map) throws Exception{
		return selectList("place_menu.se_pl_menu_list", map);
	}
	
	/** 23.01.17 나슬기: 시설 메뉴 추가 메소드 */
	public int menuInsert(Map<String, Object> map) throws Exception{
		return Integer.parseInt(update("place_menu.in_pl_menu", map).toString());
	}
	
	/** 23.01.17 나슬기: 시설 메뉴 수정 메소드 */
	public int menuUpdate(Map<String, Object> map) throws Exception{
		return Integer.parseInt(update("place_menu.up_pl_menu", map).toString());
	}
	
	/** 23.01.17 나슬기: 시설 메뉴 삭제 메소드 */
	public int menuDelete(Map<String, Object> map) throws Exception{
		return Integer.parseInt(delete("place_menu.de_pl_menu", map).toString());
	}
}