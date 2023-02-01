package paw.togaether.review.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public interface ReviewService {
	
	void insertReview(Map<String, Object> map,HttpSession session, MultipartFile[] uploadFile)throws Exception;
	
	List<Map<String, Object>> openMyReviews(Map<String, Object> map) throws Exception;
	
	Map<String, Object> openMyReview(Map<String, Object> map) throws Exception;
	
	Map<String, Object> openMyReviewPlacePhoto(Map<String, Object> map) throws Exception;
	
	void deleteReview(Map<String, Object> map) throws Exception;
	
	void updateReview(Map<String, Object> map,HttpSession session, MultipartFile[] uploadFile) throws Exception;
	
	List<Map<String, Object>> openMyReviewPhoto(Map<String, Object> map) throws Exception;

}
