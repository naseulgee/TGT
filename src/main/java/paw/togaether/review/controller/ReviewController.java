package paw.togaether.review.controller;

import java.io.File;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
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
	
	
	/* 작업날짜 작업자: 메소드 설명
	 * 23.01.11 신현지: 리뷰작성폼으로 이동하는 메서드
	 */
	@RequestMapping(value="/review/write")
	public ModelAndView openReviewWrite(CommandMap commandMap) throws Exception{
		ModelAndView m = new ModelAndView("/review/reviewWrite");
		return m;
	}
	
	@RequestMapping(value="/review/insert")
	public ModelAndView insertReview(CommandMap commandMap,MultipartFile[] uploadFile) throws Exception{
		ModelAndView m = new ModelAndView("jsonView");
		
		log.info("update ajax post.........");
		String uploadFolder = "C:\\upload";
		
		for (MultipartFile multipartFile : uploadFile) {
			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			String uploadFileName = multipartFile.getOriginalFilename();
		
			// 전체파일경로 중 파일이름만 가져오기
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") +1);
			log.info("only file name: " + uploadFileName);
			File saveFile = new File(uploadFolder, uploadFileName);
		}
		return m;
	}

}
