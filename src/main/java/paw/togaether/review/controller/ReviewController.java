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
		
		//상세보기 구현될 때까지는 이걸 사용
		m.addObject("re_pl_idx", "1");
		
		//상세보기 페이지까지 구현되면 아래 메서드 쓰기
		//m.addObject("re_pl_idx",commandMap.get("re_pl_idx"));
		return m;
	}
	
	
	/** 23.01.13 신현지: 리뷰등록 메서드
	 */
	@RequestMapping(value="/review/insert")
	public ResponseEntity<String> insertReview(CommandMap commandMap,HttpSession session, MultipartFile[] uploadFile) throws Exception{

		System.out.println("ajax로부터 업로드된 파일의 개수 : "+ uploadFile.length);
		System.out.println(commandMap.getMap());
		//review등록과 photo등록에 대한 처리
		reviewService.insertReview(commandMap.getMap(),session,uploadFile); //사용시 주석 풀어주기
		
		Map<String, Object> map = new HashMap<String, Object>();
		//리다이렉트 url를 작성해주면 된다!
		map.put("re_url", "/mypage/review/list.paw");
		return new ResponseEntity<String>("/mypage/review/list.paw",HttpStatus.OK);
	}
	
	/** 23.01.20 신현지: 마이페이지에서 내 리뷰목록 조회 메서드
	 */
	@RequestMapping(value="/mypage/review/list")
	public ModelAndView openMyReviews(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView m = new ModelAndView("/mypage/review/list");
		session.setAttribute("mem_id", "aaa123"); //★나중에 공유 시에는 지워줄 것!!★
		String mem_id = (String)session.getAttribute("mem_id"); //로그인 아이디가져오기
		commandMap.put("mem_id", mem_id);
		
		List<Map<String,Object>> reviewList = reviewService.openMyReviews(commandMap.getMap());
		m.addObject("reviewList",reviewList);
		return m;
	}
	
	/** 작업날짜 작업자: 메소드 설명
	 * 23.01.25 신현지: 마이페이지에서 내 리뷰(특정 하나) 조회 메서드
	 */
	@RequestMapping(value="/mypage/review/myReview")
	public ModelAndView openMyReview(CommandMap commandMap, HttpSession session) throws Exception{
		ModelAndView m = new ModelAndView("/mypage/review/myReview");
		
		//리뷰 가져오기
		Map<String,Object> review =  reviewService.openMyReview(commandMap.getMap());
		m.addObject("review",review);
		
		//시설썸넴 가져오기
		commandMap.put("pl_idx",review.get("RE_PL_IDX"));   //시설번호를 가져오기
		Map<String,Object> placePhoto =  reviewService.openMyReviewPlacePhoto(commandMap.getMap());
		m.addObject("placePhoto",placePhoto);
		
		//후기사진 가져오기
		List<Map<String,Object>> photos =  reviewService.openMyReviewPhoto(commandMap.getMap());
		m.addObject("photos", photos); 
		
		return m;
	}
	

}
