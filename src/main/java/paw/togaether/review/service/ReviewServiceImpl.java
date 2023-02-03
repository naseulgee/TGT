package paw.togaether.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import paw.togaether.common.photo.dao.PhotoDAO;
import paw.togaether.common.util.FileUtils;
import paw.togaether.review.dao.ReviewDAO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reviewDAO")
	private ReviewDAO reviewDAO;
	
	//----------시설과 회원의 Service단에도 추가해줘야 할 것----------
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="photoDAO")
	private PhotoDAO photoDAO;
	//----------------------------------------------------

	@Override
	public void insertReview(Map<String, Object> map,HttpSession session, MultipartFile[] uploadFile) throws Exception {
		
		reviewDAO.insertReview(map); //리뷰등록
		
		//사진등록 및 사진저장, 썸네일저장
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map,session, uploadFile);
		for(int i=0, size=list.size(); i<size; i++) {
			photoDAO.insertPhoto(list.get(i));
		}
	}

	@Override
	public List<Map<String, Object>> openMyReviews(Map<String, Object> map) throws Exception {
		return reviewDAO.openMyReviews(map);
	}

	@Override
	public Map<String, Object> openMyReview(Map<String, Object> map) throws Exception {
		return reviewDAO.openMyReview(map);
	}

	@Override
	public List<Map<String, Object>> openMyReviewPhoto(Map<String, Object> map) throws Exception {
		return photoDAO.selectMyPhoto(map);
	}

	@Override
	public Map<String, Object> openMyReviewPlacePhoto(Map<String, Object> map) throws Exception {
		return reviewDAO.openMyReviewPlacePhoto(map);
	}

	@Override
	public void deleteReview(Map<String, Object> map) throws Exception {
		reviewDAO.deleteReview(map); //리뷰삭제
		photoDAO.deletePhoto(map); //리뷰관련사진삭제
	}

	@Override
	public void updateReview(Map<String, Object> map, HttpSession session, MultipartFile[] uploadFile)
			throws Exception {
		reviewDAO.updateReview(map); //리뷰내용,별점 업데이트
		photoDAO.deletePhoto(map); //리뷰관련 사진 일단 전부 삭제 (re_del_gb='Y')
		
		//기존 사진 업데이트해주기
		for (String key : map.keySet()) {
			Map<String,Object> photoMap = new HashMap<String,Object>();
			if ((key.length()>=5) && key.substring(0, 4).equals("idx_")) {
				photoMap.put("ph_idx",map.get(key)); //photo번호를 통해 re_del_gb='Y'로 변경
				photoDAO.updatePhoto(photoMap);
			}
		}
		
		//새로운 사진 있으면 저장
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map,session, uploadFile);
		for(int i=0, size=list.size(); i<size; i++) {
			photoDAO.insertPhoto(list.get(i));
		}
		
	}

}
