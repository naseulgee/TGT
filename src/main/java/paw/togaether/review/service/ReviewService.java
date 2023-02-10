package paw.togaether.review.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public interface ReviewService {
	
	void insertReview(Map<String, Object> map,HttpSession session, MultipartFile[] uploadFile)throws Exception;
	
	Map<String, Object> openMyReview(Map<String, Object> map) throws Exception;
	
	Map<String, Object> openMyReviewPlacePhoto(Map<String, Object> map) throws Exception;
	
	void deleteReview(Map<String, Object> map) throws Exception;
	
	void updateReview(Map<String, Object> map,HttpSession session, MultipartFile[] uploadFile) throws Exception;
	
	List<Map<String, Object>> openMyReviewPhoto(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> openAllReviews(Map<String, Object> map) throws Exception ;
	
	//시설 상세보기에서 사용하는 메서드
	List<Map<String, Object>> openFiveReviews(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> openAllPlaceReviews(Map<String, Object> map) throws Exception ;
	
	Map<String, Object> openReviewInfo(Map<String, Object> map) throws Exception;
	
	Map<String, Object> checkTodayReview(Map<String, Object> map) throws Exception;
	
	//리스팅할 목록들 가져오기
	List<Map<String, Object>> selectMyReviews(Map<String, Object> map) throws Exception;

}
