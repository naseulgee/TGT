package paw.togaether.place.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

/* 23.01.17 나슬기: place_cate_SQL.xml과 맵핑되는 DAO 클래스 */
@Repository("placeCateDAO")
public class PlaceCateDAO extends AbstractDAO {
	/* 23.01.17 나슬기: 시설 카테고리 조회 메소드. 페이징 처리는 하지 않는다. */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCateList(Map<String, Object> map) throws Exception{
		return selectList("place_cate.se_pl_cate_list", map);
	}
	
	/* 23.01.17 나슬기: 시설 카테고리 추가 메소드 */
	public int insertCate(Map<String, Object> map) throws Exception{
		return Integer.parseInt(insert("place_cate.in_pl_cate", map).toString());
	}
	
	/* 23.01.17 나슬기: 시설 카테고리 수정 메소드 */
	public int updateCate(Map<String, Object> map) throws Exception{
		return Integer.parseInt(update("place_cate.up_pl_cate", map).toString());
	}
	
	/* 23.01.17 나슬기: 시설 카테고리 삭제 메소드 */
	public int deleteCate(int pc_idx) throws Exception{
		return Integer.parseInt(delete("place_cate.de_pl_cate", pc_idx).toString());
	}
}