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

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> openMyReviews(Map<String, Object> map) throws Exception {
		 return (List<Map<String, Object>>)selectList("review.openMyReviews", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> openMyReview(Map<String, Object> map) throws Exception {
		 return (Map<String, Object>)selectOne("review.openMyReview", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> openMyReviewPlacePhoto(Map<String, Object> map) throws Exception {
		 return (Map<String, Object>)selectOne("review.openMyReviewPlacePhoto", map);
	}
	
	public void deleteReview(Map<String, Object> map) throws Exception {
		 update("review.deleteReview", map);
	}
	
	public void updateReview(Map<String, Object> map) throws Exception {
		 update("review.updateReview", map);
	}
	
	

}
