package paw.togaether.mbti.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface MbtiService {
	
	
	void mbtiModify(Map<String, Object> map, HttpServletRequest request) throws Exception;

}
