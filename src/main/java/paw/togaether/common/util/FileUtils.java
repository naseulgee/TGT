package paw.togaether.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;
//@Component어노테이션을 이용하여 이 객체의 관리를 스프링이 담당
@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "/resources/upload/";
	
	Logger log = Logger.getLogger(this.getClass());

	public List<Map<String,Object>> parseInsertFileInfo(Map<String,Object> map,HttpSession session, MultipartFile[] uploadFile) throws Exception{
		
		//저장경로(개인별로 수정할 것) webapp내 resources내 upload라는 폴더에 사진저장
		String uploadFolder = session.getServletContext().getRealPath(filePath);

		//디렉토리가 없다면 생성
		File file = new File(uploadFolder);
        if(!file.exists()){ file.mkdirs(); }
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		
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
			
			map.put("ph_original_file_name", uploadFileName); //ph_original_file_name(원본파일명)
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "")+ originalFileExtension; //파일저장시 사용할 uuid생성
			map.put("ph_stored_file_name", storedFileName);//ph_stored_file_name(저장시파일명)
			map.put("ph_file_size", multipartFile.getSize()); //ph_file_size(파일의 사이즈)
			list.add(map); //list의 한 요소로 저장
			//이미지 저장에 대한 처리
			try {
				//1.경로에 파일 저장
				File saveFile = new File(uploadFolder, storedFileName);
				multipartFile.transferTo(saveFile);
				
				//2.경로에 썸네일 이미지도 저장
				FileOutputStream thumbnail = new FileOutputStream(new File(uploadFolder, "s_" +storedFileName));
	 			Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 200,200);
				thumbnail.close();
				
			} catch (Exception e) { log.error(e.getMessage()); }
		}	return list;
	}

	
}















