package paw.togaether.place.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import paw.togaether.common.domain.CommandMap;
import paw.togaether.place.service.PlaceService;

@Controller
@RequestMapping("/admin/place")
public class PlaceAdminController {
	Logger log = Logger.getLogger(this.getClass());
	
	//시설, 시설 카테고리, 시설 메뉴 관련 서비스
	@Resource(name="placeService")
	private PlaceService placeService;
	
	//시설 관련
	/** 23.01.13 나슬기: 시설 리스트 메소드 */
	@RequestMapping("/list")
	public void placeList(CommandMap commandMap) {}
	
	/** 23.01.13 나슬기: 시설 상세보기 메소드 */
	@RequestMapping("/detail/{pl_idx}")
	public void placeDetail(@PathVariable("pl_idx") int cafe_idx, CommandMap commandMap) {}
	
	/** 23.01.13 나슬기: 시설 등록 폼 메소드 */
	@RequestMapping("/writeForm")
	public void placeRegForm(CommandMap commandMap) {}
	/** 23.01.13 나슬기: 시설 등록 처리 메소드 */
	@PostMapping("/write")
	public void placeReg(CommandMap commandMap) {}
	
	/** 23.01.13 나슬기: 시설 수정 폼 메소드 */
	@RequestMapping("/modifyForm")
	public void placeModiForm(CommandMap commandMap) {}
	/** 23.01.13 나슬기: 시설 수정 처리 메소드 */
	@PostMapping("/modify")
	public void placeModi(CommandMap commandMap) {}
	
	/** 23.01.13 나슬기: 시설 삭제 처리 메소드 */
	@PostMapping("/delete")
	public void placeDelete(CommandMap commandMap) {}
	
	//시설 카테고리 관련
	/** 23.01.13 나슬기: 시설 카테고리 리스트 메소드 */
	@RequestMapping("/cate/list")
	public ModelAndView cateList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
		//카테고리 리스트 불러오기
		List<Map<String, Object>> ori_list = placeService.cateList(commandMap.getMap());
		//초성 그룹을 담을 Set 객체 생성
		String[] chs = {"ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ", "ㄹ", "ㅁ", "ㅂ", "ㅃ", "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"};
		int uniVal = 0;
		Set<String> first_list = new HashSet<String>();
		//리스트에 담긴 만큼 반복
		for (Map<String, Object> map : ori_list) {
			//카테고리 명의 첫번째 단어를 꺼내와서 변수에 저장
			char first = map.get("PC_NAME").toString().charAt(0);
			//한글일 경우 초성 분리하는 로직
			if(first >= 0xAC00) {//첫번째 단어가 유니코드 가 보다 크다면
				//첫단어에서 한글 시작점을 뺀 후
				uniVal = (first - 0xAC00);
				uniVal = ((uniVal - (uniVal % 28))/28)/21;
				System.out.println(chs[uniVal]);
			}
		}
		mv.addObject("cate_list", placeService.cateList(commandMap.getMap()));
		return mv;
	}
	/** 23.01.13 나슬기: 시설 카테고리 리스트 메소드 */
//	@RequestMapping(value = "/cate/list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
//	@ResponseBody
//	public ResponseEntity<List<Map<String, Object>>> cateList(CommandMap commandMap) throws Exception{
//		List<Map<String, Object>> cate_list = placeService.cateList(commandMap.getMap());
//		return new ResponseEntity<>(cate_list, HttpStatus.OK);//ResponseEntity객체에 응답할 데이터 list와 상태를 저장하여 전달
//	}
	
	/** 23.01.13 나슬기: 시설 카테고리 등록 처리 메소드 */
	@PostMapping(value = "/cate/write", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity cateReg(CommandMap commandMap) throws Exception{
		System.out.println(1111);
		int result = placeService.cateWrite(commandMap.getMap());
		if(result > 0) return new ResponseEntity(HttpStatus.OK);//ResponseEntity객체에 응답할 데이터 list와 상태를 저장하여 전달
		return new ResponseEntity(HttpStatus.EXPECTATION_FAILED);
	}
	
	/** 23.01.13 나슬기: 시설 카테고리 수정 처리 메소드 */
	@PostMapping(value = "/cate/modify", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<Map<String, Object>>> cateModi(CommandMap commandMap) {
		List<Map<String, Object>> list = new ArrayList<>();
		return new ResponseEntity<>(list, HttpStatus.OK);//ResponseEntity객체에 응답할 데이터 list와 상태를 저장하여 전달
	}
	
	/** 23.01.13 나슬기: 시설 카테고리 삭제 처리 메소드 */
	@PostMapping(value = "/cate/delete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<Map<String, Object>>> cateDelete(CommandMap commandMap) {
		List<Map<String, Object>> list = new ArrayList<>();
		return new ResponseEntity<>(list, HttpStatus.OK);//ResponseEntity객체에 응답할 데이터 list와 상태를 저장하여 전달
	}
	
	//시설 메뉴 관련
	/** 23.01.13 나슬기: 시설 메뉴 리스트 메소드 */
	@RequestMapping("/menu/list")
	public void menuList(CommandMap commandMap) {}
	
	/** 23.01.13 나슬기: 시설 메뉴 등록 처리 메소드 */
	@PostMapping(value = "/menu/write", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<Map<String, Object>>> menuReg(CommandMap commandMap) {
		List<Map<String, Object>> list = new ArrayList<>();
		return new ResponseEntity<>(list, HttpStatus.OK);//ResponseEntity객체에 응답할 데이터 list와 상태를 저장하여 전달
	}
	
	/** 23.01.13 나슬기: 시설 메뉴 수정 처리 메소드 */
	@PostMapping(value = "/menu/modify", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<Map<String, Object>>> menuModi(CommandMap commandMap) {
		List<Map<String, Object>> list = new ArrayList<>();
		return new ResponseEntity<>(list, HttpStatus.OK);//ResponseEntity객체에 응답할 데이터 list와 상태를 저장하여 전달
	}
	
	/** 23.01.13 나슬기: 시설 메뉴 삭제 처리 메소드 */
	@PostMapping(value = "/menu/delete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<Map<String, Object>>> menuDelete(CommandMap commandMap) {
		List<Map<String, Object>> list = new ArrayList<>();
		return new ResponseEntity<>(list, HttpStatus.OK);//ResponseEntity객체에 응답할 데이터 list와 상태를 저장하여 전달
	}
}