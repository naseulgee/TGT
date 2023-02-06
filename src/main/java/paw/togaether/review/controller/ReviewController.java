package paw.togaether.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import paw.togaether.common.domain.CommandMap;
import paw.togaether.review.service.ReviewService;

@Controller
public class ReviewController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="reviewService")
	private ReviewService reviewService;
	
	
	/** 23.01.11 신현지: 리뷰작성폼으로 이동하는 메서드
	 */
	@RequestMapping(value="/review/write")
	public ModelAndView openReviewWrite(CommandMap commandMap) throws Exception{
		ModelAndView m = new ModelAndView("/review/reviewWrite");
		
		System.out.println("시설번호:"+commandMap);
		m.addObject("re_pl_idx",commandMap.get("pl_idx"));
		return m;
	}
	
	
	/** 23.01.13 신현지: 리뷰등록 메서드
	 */
	@RequestMapping(value="/review/insert")
	public ResponseEntity<String> insertReview(CommandMap commandMap,HttpSession session, MultipartFile[] uploadFile) throws Exception{
		
		//오늘 이미 리뷰를 작성했는지 check
		Map<String, Object> review = reviewService.checkTodayReview(commandMap.getMap());
		
		System.out.println(review);//null
		//비어있다면
		if(review == null)  {
			//review등록과 photo등록에 대한 처리
			reviewService.insertReview(commandMap.getMap(),session,uploadFile); //사용시 주석 풀어주기
			return new ResponseEntity<String>("/mypage/review/list.paw",HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("리뷰는 하루에 1개만 작성할 수 있습니다.",HttpStatus.BAD_REQUEST);
		}
		
	}
	
	/** 23.01.20 신현지: 마이페이지에서 내 리뷰목록 조회 메서드
	 */
	@RequestMapping(value="/mypage/review/list")
	public ModelAndView openMyReviews(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView m = new ModelAndView("/mypage/review/list");
		String mem_id = (String)session.getAttribute("mem_id"); //로그인 아이디가져오기
		commandMap.put("mem_id", mem_id);
		
		List<Map<String,Object>> reviewList = reviewService.openMyReviews(commandMap.getMap());
		m.addObject("reviewList",reviewList);
		return m;
	}
	
	/** 23.01.25 신현지: 마이페이지에서 내 리뷰(특정 하나) 조회 메서드
	 */
	@RequestMapping(value="/mypage/review/detail")
	public ModelAndView openMyReview(CommandMap commandMap) throws Exception{
		ModelAndView m = new ModelAndView("/mypage/review/myReview");
		
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
	
	/**23.01.25 신현지: 리뷰수정폼으로 이동
	 */
	@RequestMapping(value="/review/updateForm")
	public ModelAndView openReviewUpdate(CommandMap commandMap) throws Exception{
		ModelAndView m = new ModelAndView("/mypage/review/updateForm");
		
		Map<String,Object> review =  reviewService.openMyReview(commandMap.getMap());
		m.addObject("review",review);
		
		//후기사진 가져오기
		List<Map<String,Object>> photos =  reviewService.openMyReviewPhoto(commandMap.getMap());
		m.addObject("photos", photos); 
		return m;
	}
	
	/** 23.01.31 신현지 : 리뷰수정
	  */
	@RequestMapping(value="/review/update")
	public ResponseEntity<String> updateReview(CommandMap commandMap,HttpSession session, MultipartFile[] uploadFile) throws Exception{

		//review등록과 photo등록에 대한 처리
		reviewService.updateReview(commandMap.getMap(),session,uploadFile); //사용시 주석 풀어주기
		return new ResponseEntity<String>("/mypage/review/list.paw",HttpStatus.OK);
	}
	
	
	/** 23.01.29 신현지 : 리뷰삭제
	  */
	@RequestMapping(value="/review/delete")
	public ModelAndView deleteReview(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView m = new ModelAndView("redirect:/mypage/review/list.paw"); //삭제 후 리뷰목록으로 이동
		reviewService.deleteReview(commandMap.getMap());
		return m;
	}
	
	/** 23.02.06 신현지 : 리뷰다섯개 가져오기
	  */
	@RequestMapping(value="/review/test")
	public ModelAndView openFiveReviews(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView m = new ModelAndView("redirect:/sample.paw"); //삭제 후 리뷰목록으로 이동
		commandMap.put("pl_idx", 2);
		List<Map<String,Object>> reviews = reviewService.openFiveReviews(commandMap.getMap());
		
		m.addObject("reviews",reviews);
		return m;
	}
	

	

}
