package paw.togaether.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface ReviewService {
	
	void insertReview(Map<String, Object> map, MultipartFile[] uploadFile)throws Exception;
	
	List<Map<String, Object>> openMyReviews(Map<String, Object> map) throws Exception;

}
