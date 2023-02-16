package paw.togaether.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import paw.togaether.common.domain.CommandMap;
import paw.togaether.review.service.ReviewService;

@Controller
public class ReviewAdminController {

	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reviewService")
	private ReviewService reviewService;
	
	/** 23.02.06 신현지 : 관리자페이지에서 모든 리뷰 리스트로 출력 */
	@RequestMapping(value="/admin/review/list")
	public ModelAndView openAllReviews(CommandMap commandMap, HttpSession session) throws Exception{
		
		ModelAndView m = new ModelAndView("/admin/review/list"); 
		List<Map<String,Object>> reviews = reviewService.openAllReviews(commandMap.getMap());
		m.addObject("reviews",reviews);
		
		return m;
	}
	
	
	/** 23.01.25 신현지: 마이페이지에서 내 리뷰(특정 하나) 조회 메서드 */
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
	
	
	/** 23.02.06 신현지 : 모든 리뷰를 리스트로 출력 */
	@RequestMapping(value="/admin/review/search")
	public ModelAndView searchReviews(CommandMap commandMap) throws Exception{
		
		ModelAndView m = new ModelAndView("/admin/review/list"); 		
		return m;
	}
	
	/** 23.02.14 신현지 : 리뷰리스트 페이징 */
	@RequestMapping(value="/admin/review/selectSearch")
	public ModelAndView selectSearchReviews(CommandMap commandMap) throws Exception{
		
		ModelAndView m = new ModelAndView("jsonView"); 
		System.out.println("검색타입은 "+ commandMap.get("searchType"));
		System.out.println("검색키워드는 : "+ commandMap.get("keyword"));
		
		List<Map<String,Object>> reviewList = reviewService.openAllReviews(commandMap.getMap());
		m.addObject("reviewList",reviewList);
		
		if(reviewList.size() > 0){
			m.addObject("TOTAL", reviewList.get(0).get("TOTAL_COUNT"));
		} else{ m.addObject("TOTAL", 0); }
		return m;
	}
	
	/** 23.02.09 신현지 : 시설에 대한 모든 리뷰 출력*/
	@RequestMapping(value="/admin/place/detail/{pl_idx}/review/list")
	public ModelAndView openPlaceAllReviews(@PathVariable("pl_idx") int pl_idx, CommandMap commandMap) throws Exception{
		ModelAndView m = new ModelAndView("admin/review/list2");
		
		String option = (String)commandMap.get("option");
		if (option == null) { option = "0"; } //option이 없으면 그냥 최신순으로 정렬
		
		m.addObject("pl_idx", pl_idx);
		m.addObject("option", option);
		return m;
	}
	
	/** 23.02.09 신현지 : 시설에 대한 모든 리뷰를 페이징해서 출력*/
	@RequestMapping(value="/admin/place/detail/{pl_idx}/review/selectList")
	public ModelAndView selectPlaceAllReviews(@PathVariable("pl_idx") int pl_idx , CommandMap commandMap) throws Exception{
		ModelAndView m = new ModelAndView("jsonView");

		commandMap.put("pl_idx", pl_idx);
		
		List<Map<String,Object>> reviewList = reviewService.openAllPlaceReviews(commandMap.getMap());
		m.addObject("reviewList", reviewList);
		m.addObject("option",commandMap.get("option"));
		Map<String,Object> info = reviewService.openReviewInfo(commandMap.getMap());
		m.addObject("info", info);
		
		if(reviewList.size() > 0){
			m.addObject("TOTAL", reviewList.get(0).get("TOTAL_COUNT"));
		} else{ m.addObject("TOTAL", 0); }
		return m;
	}
	
	
	/** 23.02.10 신현지 : 관리자의 리뷰삭제*/
	@RequestMapping(value="/admin/review/delete")
	public ModelAndView deleteReview(CommandMap commandMap, HttpSession session) throws Exception{
		String redirectUrl ="redirect:/admin/place/detail/"+commandMap.get("pl_idx")+"/review/list.paw";
		ModelAndView m = new ModelAndView(redirectUrl); //삭제 후 리뷰목록으로 이동
		reviewService.deleteReview(commandMap.getMap());
		return m;
	}
	
}
