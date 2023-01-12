package paw.togaether.together.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import paw.togaether.together.dao.TogetherDAO;

//서비스 로직 해결을 위해 togetherService를 사용하겠다
@Service("togetherService")
public class TogetherServiceImpl implements TogetherService {
	//로그 설정
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="togetherDAO")
	private TogetherDAO togetherDAO;
	
	//함께해요 페이지 리스트 및 검색
	@Override
	public List<Map<String, Object>> togetherList(Map<String, Object> map) throws Exception {
		return togetherDAO.togetherList(map);
	}
	
	

}
