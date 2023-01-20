package paw.togaether.review.dao;

import java.util.List;
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
	

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> openMyReviews(Map<String, Object> map) throws Exception {
		 return (List<Map<String, Object>>)selectList("review.openMyReviews", map);
	}

}
