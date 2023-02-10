package paw.togaether.together.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import paw.togaether.together.dao.TogetherMyPageDAO;

@Service("togetherMyPageService")
public class TogetherMyPageServiceImpl implements TogetherMyPageService{
	//로그 설정
	Logger log = Logger.getLogger(this.getClass());
		
	@Resource(name="togetherMyPageDAO")
	private TogetherMyPageDAO togetherMyPageDAO;
		
	/* 23.02.08 박선영 참여한 리스트  */
	@Override
	public List<Map<String, Object>> myTogetherList(Map<String, Object> map, HttpSession session) throws Exception {
		String mem_id = (String)session.getAttribute("mem_id"); //로그인 아이디가져오기
		map.put("mem_id", mem_id);
		return togetherMyPageDAO.myTogetherList(map);
	}
	
	/* 23.02.09 박선영 작성한 리스트  */
	@Override
	public List<Map<String, Object>> myTogeWriteList(Map<String, Object> map, HttpSession session) throws Exception {
		String mem_id = (String)session.getAttribute("mem_id"); //로그인 아이디가져오기
		map.put("mem_id", mem_id);
		return togetherMyPageDAO.myTogeWriteList(map);
	}

}
