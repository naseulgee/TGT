package paw.togaether.review.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@PostMapping(value="/review/insert")
	@ResponseBody 
	public ResponseEntity<HttpStatus> insertReview(CommandMap commandMap, MultipartFile[] uploadFile) throws Exception{

		System.out.println("ajax로부터 업로드된 파일의 개수 : "+ uploadFile.length);
		System.out.println(commandMap.getMap());
		//review등록과 photo등록에 대한 처리
		//reviewService.insertReview(commandMap.getMap(),uploadFile); //사용시 주석 풀어주기
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	/** 작업날짜 작업자: 메소드 설명
	 * 23.01.13 신현지: 마이페이지에서 내리뷰 조회 메서드
	 */
	@RequestMapping(value="/mypage/review/list")
	public ModelAndView openMyReviews(CommandMap commandMap) throws Exception{
		ModelAndView m = new ModelAndView("/mypage/review/list");
		
		
		return m;
	}
	

}
