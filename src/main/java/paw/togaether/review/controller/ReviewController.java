package paw.togaether.review.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import net.coobird.thumbnailator.Thumbnailator;
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
	
	
	/** 작업날짜 작업자: 메소드 설명
	 * 23.01.13 신현지: 리뷰등록 메서드
	 */
	@RequestMapping(value="/review/insert")
	public ModelAndView insertReview(CommandMap commandMap, MultipartFile[] uploadFile) throws Exception{
		ModelAndView m = new ModelAndView("jsonView");
		
		log.info("update ajax post.........");
		
		System.out.println("업로드된 파일의 개수 : "+ uploadFile.length);
		System.out.println(commandMap.getMap());
		
		//review등록에 대한 처리
		//reviewService.insertReview(commandMap.getMap()); 사용시 주석 풀어주기
		
		
		//-----------여기서 부터 따로 클래스로 빼서 메서드로 만들예정-------------
		String uploadFolder = "C:\\upload";

		//photo파일 하나씩 꺼내오기
		for (MultipartFile multipartFile : uploadFile) {
			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			
			// 전체파일경로 중 파일이름만 가져오기
			String uploadFileName = multipartFile.getOriginalFilename();
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") +1);
			log.info("only file name: " + uploadFileName);
			
			//파일확장자구하기
			String originalFileExtension = uploadFileName.substring(uploadFileName.lastIndexOf("."));
			
			commandMap.put("ph_original_file_name", uploadFileName); //ph_original_file_name(원본파일명)
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "")+ originalFileExtension; //파일저장시 사용할 uuid생성
			commandMap.put("ph_stored_file_name", storedFileName);//ph_stored_file_name(저장시파일명)
			commandMap.put("ph_file_size", multipartFile.getSize()); //ph_file_size(파일의 사이즈)
			
			//photo등록에 대한 처리
			try {
				//1.경로에 파일 저장
				File saveFile = new File(uploadFolder, storedFileName);
				multipartFile.transferTo(saveFile);
				
				//2.경로에 썸네일 이미지도 저장
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadFolder, "s_" +storedFileName));
	 			Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100,100);
				thumbnail.close();
				
				//3.DB의 photo테이블에 정보 삽입
				
				

			} catch (Exception e) { 
				log.error(e.getMessage()); 
			}
			

		}
		return m;
	}

}
