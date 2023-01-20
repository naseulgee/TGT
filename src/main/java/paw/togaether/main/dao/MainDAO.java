package paw.togaether.main.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

@Repository("mainDAO")
public class MainDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> boardSearchList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("main.boardSearchList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> togetherSearchList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("main.togetherSearchList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> placeSearchList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("main.placeSearchList", map);
	}
	

}
