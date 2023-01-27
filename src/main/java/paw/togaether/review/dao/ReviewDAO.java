package paw.togaether.review.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

@Repository("reviewDAO")
public class ReviewDAO extends AbstractDAO{
	
	
	public void insertReview(Map<String, Object> map) throws Exception {
		 insert("review.insertReview", map);
	}
	
	public void insertPhoto(Map<String, Object> map) throws Exception {
		 insert("photo.insertPhoto", map);
	}

}
