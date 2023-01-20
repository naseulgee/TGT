package paw.togaether.main.service;

import java.util.List;
import java.util.Map;

public interface MainService {

	List<Map<String, Object>> boardSearchList(Map<String, Object> map, String keyword, String searchType) throws Exception;

	List<Map<String, Object>> togetherSearchList(Map<String, Object> map, String keyword, String searchType) throws Exception;

	List<Map<String, Object>> placeSearchList(Map<String, Object> map, String keyword, String searchType) throws Exception;



}
