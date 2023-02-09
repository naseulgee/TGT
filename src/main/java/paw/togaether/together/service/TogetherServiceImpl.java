package paw.togaether.together.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public void togetherWrite(Map<String, Object> map, HttpSession session) throws Exception {
		String mem_id = (String)session.getAttribute("mem_id"); //로그인 아이디가져오기
		map.put("mem_id", mem_id);
		togetherDAO.togetherWrite(map);
	}
	
	/* 23.01.18 박선영 함께해요 상세보기 */
	@Override
	public Map<String, Object> togetherDetail(Map<String, Object> map, HttpSession session) throws Exception {
		String mem_id = (String)session.getAttribute("mem_id"); //로그인 아이디가져오기
		map.put("mem_id", mem_id);
		return togetherDAO.togetherDetail(map);
	}
	
	/* 23.01.19 박선영 함께해요 카테고리별 리스트 출력 */
	@Override
	public List<Map<String, Object>> togetherCateList(Map<String, Object> map, HttpSession session) throws Exception {
		String mem_id = (String)session.getAttribute("mem_id"); //로그인 아이디가져오기
		map.put("mem_id", mem_id);
		return togetherDAO.togetherCateList(map);
	}
	
	/* 23.01.20 박선영 함께해요 게시글 수정하기 */
	@Override
	public void togetherModi(Map<String, Object> map, HttpSession session) throws Exception {
		String mem_id = (String)session.getAttribute("mem_id"); //로그인 아이디가져오기
		map.put("mem_id", mem_id);
		togetherDAO.togetherModi(map);
	}
	
	/* 23.01.21 박선영 함께해요 견종분류 */
	@Override
	public List<Map<String, Object>> togetherbreed(Map<String, Object> map) throws Exception {
		return togetherDAO.togetherbreed(map);
	}
	
	/* 23.01.21 박선영 함께해요 참여자 리스트 */
	@Override
	public List<Map<String, Object>> togetherWithList(Map<String, Object> map) throws Exception {
		return togetherDAO.togetherWithList(map);
	}
	
	/* 23.01.23 박선영 게시글 삭제 */
	@Override
	public void togetherDel(Map<String, Object> map, HttpSession session) throws Exception {
		String mem_id = (String)session.getAttribute("mem_id"); //로그인 아이디가져오기
		map.put("mem_id", mem_id);
		togetherDAO.togetherDel(map);
	}
	
	/* 23.01.25 박선영 카테고리 리스트 */ 
	@Override
	public List<Map<String, Object>> togetherCate(Map<String, Object> map) throws Exception {
		return togetherDAO.togetherCate(map);
	}
	
	
	/* 23.01.27 박선영 참여하기 */
	@Override
	public void togetherWith(Map<String, Object> map, HttpSession session) throws Exception {
		String mem_id = (String)session.getAttribute("mem_id"); //로그인 아이디가져오기	
		map.put("mem_id", mem_id);
		togetherDAO.togetherWith(map);
	}
	
	/* 23.01.31 박선영 참여취소 */
	@Override
	public void togetherWithDel(Map<String, Object> map) throws Exception {
		togetherDAO.togetherWithDel(map);
	}
	
	/* 23.01.31 박선영 참여여부확인 */
	@Override
	public Map<String, Object> checkWith(Map<String, Object> map, HttpSession session) throws Exception {
		String mem_id = (String)session.getAttribute("mem_id"); //로그인 아이디가져오기	
		map.put("mem_id", mem_id);
		return togetherDAO.checkWith(map);
	}
	
	/* 23.02.06 박선영 참여회원 상세보기 */
	@Override
	public Map<String, Object> checkMem(Map<String, Object> map, HttpSession session) throws Exception {
		String mem_id = (String)session.getAttribute("mem_id"); //로그인 아이디가져오기
		map.put("mem_id", mem_id);
		return togetherDAO.checkMem(map);
	}
	
	/* 23.02.09 박선영 작성자 상세보기 */
	@Override
	public Map<String, Object> checkWriter(Map<String, Object> map, HttpSession session) throws Exception {
		String mem_id = (String)session.getAttribute("mem_id"); //로그인 아이디가져오기
		map.put("mem_id", mem_id);
		return togetherDAO.checkWriter(map);
	}

}
