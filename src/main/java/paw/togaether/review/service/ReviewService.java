package paw.togaether.review.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface ReviewService {
	
	void insertReview(Map<String, Object> map, MultipartFile[] uploadFile)throws Exception;
	
	

}
