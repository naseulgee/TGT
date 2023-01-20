package paw.togaether.together.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

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
	
	/* 함께해요 페이지 리스트 및 검색 */
	@Override
	public List<Map<String, Object>> togetherList(Map<String, Object> map) throws Exception {
		return togetherDAO.togetherList(map);
	}
	
	/* 함께해요 게시글 작성 */
	@Override
	public void togetherWrite(Map<String, Object> map) throws Exception {

		togetherDAO.togetherWrite(map);
	}
	
	/* 23.01.18 박선영 함께해요 상세보기 */
	@Override
	public Map<String, Object> togetherDetail(Map<String, Object> map) throws Exception {
		return togetherDAO.togetherDetail(map);
	}
	
	/* 23.01.19 박선영 함께해요 카테고리별 리스트 출력 */
	@Override
	public List<Map<String, Object>> togetherCateList(Map<String, Object> map) throws Exception {
		return togetherDAO.togetherCateList(map);
	}

}
