package paw.togaether.place.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
@RequestMapping("/place")
public class PlaceController {
	Logger log = Logger.getLogger(this.getClass());
	
	//시설, 시설 카테고리, 시설 메뉴 관련 서비스
	@Resource(name="placeService")
	private PlaceService placeService;
	
	/** 23.01.13 나슬기: 시설 리스트 메소드 */
	@RequestMapping("/list")
	public void placeList(CommandMap commandMap) {}
	
	/** 23.01.13 나슬기: 시설 상세보기 메소드 */
	@RequestMapping("/detail/{pl_idx}")
	public void placeDetail(@PathVariable("pl_idx") int cafe_idx, CommandMap commandMap) {}
	
	/** 23.01.13 나슬기: 시설 등록 폼 메소드 */
	@RequestMapping("/writeForm")
	public ModelAndView placeRegForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
		//카테고리 리스트 불러오기
		mv.addObject("cate_list", placeService.cateList(commandMap.getMap()));
		return mv;
	}
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
	public void placeDeleteReq(CommandMap commandMap) {}
	
	//시설 메뉴 관련
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