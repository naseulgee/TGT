package paw.togaether.mbti.service;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import paw.togaether.mbti.dao.MbtiDAO;

@Service("mbtiService")
public class MbtiServiceImpl implements MbtiService {
	
	@Resource(name = "mbtiDAO")
	private MbtiDAO mbtiDAO;

	@Override
	public void mbtiModify(Map<String, Object> map, HttpServletRequest request) throws Exception {
		mbtiDAO.mbtiModify(map);
	}
}
