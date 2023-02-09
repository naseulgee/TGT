package paw.togaether.together.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface TogetherMyPageService {
	
	//내가참여한 게시글 리스트
	List<Map<String, Object>> myTogetherList(Map<String, Object> map, HttpSession session) throws Exception;

}
