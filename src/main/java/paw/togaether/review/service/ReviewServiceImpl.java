package paw.togaether.review.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import paw.togaether.common.util.FileUtils;
import paw.togaether.review.dao.ReviewDAO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reviewDAO")
	private ReviewDAO reviewDAO;
	
	//시설과 회원의 Service단에도 추가해줘야 할 것
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Override
	public void insertReview(Map<String, Object> map, MultipartFile[] uploadFile) throws Exception {
		
		reviewDAO.insertReview(map); //리뷰등록
		
		//사진등록 및 사진저장, 썸네일저장
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, uploadFile);
		for(int i=0, size=list.size(); i<size; i++) {
			reviewDAO.insertPhoto(list.get(i));
		}
	}

}
