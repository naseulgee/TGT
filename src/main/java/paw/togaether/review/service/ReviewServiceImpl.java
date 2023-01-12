package paw.togaether.review.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import paw.togaether.review.dao.ReviewDAO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reviewDAO")
	private ReviewDAO reviewDAO;

	@Override
	public Map<String, Object> selectUserInfo(Map<String, Object> map) throws Exception {
		return reviewDAO.selectUserInfo(map);
	}

}
