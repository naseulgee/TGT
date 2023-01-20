package paw.togaether.main.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import paw.togaether.main.dao.MainDAO;

@Service("mainService")
public class MainServiceImpl implements MainService {
	
	@Resource(name = "mainDAO")
	private MainDAO mainDAO;

	@Override
	public List<Map<String, Object>> boardSearchList(Map<String, Object> map, String keyword, String searchType) throws Exception {
		return mainDAO.boardSearchList(map);
	}


	@Override
	public List<Map<String, Object>> togetherSearchList(Map<String, Object> map, String keyword, String searchType) throws Exception {
		return mainDAO.togetherSearchList(map);
	}

	@Override
	public List<Map<String, Object>> placeSearchList(Map<String, Object> map, String keyword, String searchType) throws Exception {
		return mainDAO.placeSearchList(map);
	}

	
	

}
