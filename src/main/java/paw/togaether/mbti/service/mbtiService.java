package paw.togaether.mbti.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface mbtiService {
	
	
	void mbti_modify(Map<String, Object> map, HttpServletRequest request) throws Exception;

}
