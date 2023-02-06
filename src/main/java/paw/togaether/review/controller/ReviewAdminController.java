package paw.togaether.review.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import paw.togaether.common.domain.CommandMap;
import paw.togaether.review.service.ReviewService;

@Controller
public class ReviewAdminController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reviewService")
	private ReviewService reviewService;
	
	/**
	 * 23.02.06 신현지 : 관리자페이지에서 모든 리뷰 리스트로 출력
	 * */
	@RequestMapping(value="/admin/review/list")
	public ModelAndView openAllReviews(CommandMap commandMap, HttpSession session) throws Exception{
		
		ModelAndView m = new ModelAndView("/admin/review/list"); 
		List<Map<String,Object>> reviews = reviewService.openAllReviews(commandMap.getMap());
		m.addObject("reviews",reviews);
		
		return m;
	}
	
	/**
	 * 23.02.06 신현지 : 리뷰검색
	 * */
	@RequestMapping(value="/admin/review/search")
	public ModelAndView searchReviews(CommandMap commandMap, HttpSession session) throws Exception{
		
		ModelAndView m = new ModelAndView("/admin/review/list"); 
		List<Map<String,Object>> reviews = reviewService.openAllReviews(commandMap.getMap());
		m.addObject("reviews",reviews);
		
		return m;
	}
	
	
	
	/** 23.01.25 신현지: 마이페이지에서 내 리뷰(특정 하나) 조회 메서드
	 */
	@RequestMapping(value="/admin/review/detail")
	public ModelAndView openMyReview(CommandMap commandMap) throws Exception{
		ModelAndView m = new ModelAndView("/admin/review/detail");
		
		//리뷰 가져오기
		Map<String,Object> review =  reviewService.openMyReview(commandMap.getMap());
		m.addObject("review",review);
		
		//시설썸넴 가져오기
		Map<String,Object> placePhoto =  reviewService.openMyReviewPlacePhoto(commandMap.getMap());
		m.addObject("placePhoto",placePhoto);
		
		//후기사진 가져오기
		List<Map<String,Object>> photos =  reviewService.openMyReviewPhoto(commandMap.getMap());
		m.addObject("photos", photos); 
		return m;
	}
	
	
}
