package paw.togaether.mbti.service;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import paw.togaether.mbti.dao.mbtiDAO;

@Service("mbtiService")
public class mbtiServiceImpl implements mbtiService {
	
	@Resource(name = "mbtiDAO")
	private mbtiDAO mbtiDAO;

	@Override
	public void mbti_modify(Map<String, Object> map, HttpServletRequest request) throws Exception {
		mbtiDAO.mbti_modify(map);
	}
}
