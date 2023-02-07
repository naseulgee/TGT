package paw.togaether.place.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import paw.togaether.common.domain.CommandMap;
import paw.togaether.place.service.PlaceService;
import paw.togaether.review.service.ReviewService;

@Controller
@RequestMapping("/admin/place")
public class PlaceAdminController {
	Logger log = Logger.getLogger(this.getClass());
	
	//시설, 시설 카테고리, 시설 메뉴 관련 서비스
	@Resource(name="placeService")
	private PlaceService placeService;
	//리뷰 관련 서비스
	@Resource(name="reviewService")
	private ReviewService reviewService;
	
	//시설 관련
	/** 23.02.07 나슬기: 시설 리스트 메소드 */
	@GetMapping("/list")
	public void placeListFrame(CommandMap commandMap) {}
	@PostMapping("/list")
	public ModelAndView placeList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		//시설 리스트 불러오기
		List<Map<String, Object>> list = placeService.placeList(commandMap.getMap());
		mv.addObject("list", list);
		//총 개수
		if (list.size() > 0) {
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT"));
		} else {
			mv.addObject("TOTAL", 0);
		}
		//카테고리 리스트 불러오기
		mv.addObject("select_cate", commandMap.get("pl_pc_idx"));
		mv.addObject("cate_list", placeService.cateList(commandMap.getMap()));
		
		return mv;
	}
	
	/** 23.02.07 나슬기: 시설 상세보기 메소드 */
	@RequestMapping("/detail/{pl_idx}")
	public ModelAndView placeDetail(@PathVariable("pl_idx") int cafe_idx) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/place/detail");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pl_idx", cafe_idx);
		map.put("ph_board_type", "place");
		mv.addObject("detail", placeService.placeDetail(map));
		mv.addObject("menu", placeService.menuList(map));
		mv.addObject("review_avg", reviewService.openReviewInfo(map));
		mv.addObject("review_list", reviewService.openFiveReviews(map));
		return mv;
	}
	
	/** 23.02.07 나슬기: 시설 등록/수정 폼 메소드 */
	@RequestMapping(value={"/writeForm", "/modifyForm"})
	public ModelAndView placeRegForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/admin/place/writeForm");
		//카테고리 리스트 불러오기
		mv.addObject("cate_list", placeService.cateList(commandMap.getMap()));
		//idx값을 넘겨받았다면 수정할 상세 정보 불러오기
		if(commandMap.get("pl_idx") != null) mv.addObject("detail", placeService.placeDetail(commandMap.getMap()));
		return mv;
	}
	/** 23.02.07 나슬기: 시설 등록/수정 처리 메소드 */
	@PostMapping(value={"/write", "/modify"})
	public ResponseEntity<String> placeReg(CommandMap commandMap, HttpSession session, MultipartFile[] uploadFile) {
		//서비스 호출 전 체크박스로 넘어오는 휴일 정보에 대한 가공 처리 필수!
		if(commandMap.get("pl_offday") != null) {
			Object[] off_check = (Object[]) commandMap.get("pl_offday");//해당 값을 문자열로 이루어진 배열에 저장
			commandMap.put("pl_offday",
					Arrays.deepToString(off_check)
					.toString()
					.replaceAll(" ", "")
					.replace("[", "")
					.replace("]", ""));//배열을 문자열로 변환 후 공백 및 [] 제거
		}
		commandMap.remove("open_ampm");//오전 오후에 대한 내용 제거
		commandMap.remove("close_ampm");//오전 오후에 대한 내용 제거
		
		//Mybatis에서 동적쿼리문으로 반복 처리하기 위해 신규 맵을 생성하여 다시 담아준다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ph_board_type", commandMap.get("ph_board_type"));
		commandMap.remove("ph_board_type");
		map.put("map", commandMap.getMap());
		try {
			int idx;
			//idx값을 넘겨받았다면 수정할 상세 정보 불러오기
			if(commandMap.get("pl_idx") != null) {
				placeService.placeModify(map, session, uploadFile);
				idx = Integer.parseInt(commandMap.get("pl_idx").toString());
			}else {
				placeService.placeWrite(map, session, uploadFile);
				idx = Integer.parseInt(map.get("PL_IDX_NEXT").toString());
			}
			return new ResponseEntity<String>("/admin/place/detail/"+idx+".paw",HttpStatus.OK);
		}catch(Exception e) { e.printStackTrace(); }
		return null;
	}
	
	/** 23.02.07 나슬기: 시설 삭제 처리 메소드 */
	@PostMapping(value = "/delete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<HttpStatus> placeDelete(@RequestBody Map<String, Object> commandMap) {
		try {
			placeService.placeDelete(commandMap);
		}catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.EXPECTATION_FAILED);
		}
		return new ResponseEntity<>(HttpStatus.OK);//정상적으로 삽입이 되었다면
	}
	
	//시설 카테고리 관련
	/** 23.01.19 나슬기: 시설 카테고리 리스트 메소드 */
	@RequestMapping("/cate/list")
	public ModelAndView cateList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView();
		//카테고리 리스트 불러오기
		List<Map<String, Object>> ori_list = placeService.cateList(commandMap.getMap());
		
		//한글 자음 목록
		char[] chs = {'ㄱ', 'ㄲ', 'ㄴ', 'ㄷ', 'ㄸ', 'ㄹ', 'ㅁ', 'ㅂ', 'ㅃ', 'ㅅ', 'ㅆ', 'ㅇ', 'ㅈ', 'ㅉ', 'ㅊ', 'ㅋ', 'ㅌ', 'ㅍ', 'ㅎ'};
		int uniVal = 0;
		//초성별 그룹을 담을 리스트 객체 생성
		Map<Character, List<Map<String, Object>>> first_map = new HashMap<Character, List<Map<String, Object>>>();
		for (Map<String, Object> map : ori_list) {//리스트에 담긴 만큼 반복
			//카테고리 명의 첫번째 단어를 꺼내와서 변수에 저장
			char first = map.get("PC_NAME").toString().charAt(0);
			//한글일 경우 초성 분리하는 로직
			if(first >= 0xAC00) {//첫번째 단어가 유니코드 '가' 보다 크다면
				uniVal = (first - 0xAC00);//첫단어에서 한글 시작점을 뺀 후
				uniVal = ((uniVal - (uniVal % 28))/28)/21;//중성 종성을 나누는 작업 실행
				first = chs[uniVal];
			}
			//그룹에 해당 초성의 키가 없을 때
			if(!first_map.containsKey(first)) {//키와 배열 생성
				first_map.put(first, new ArrayList<>());
			}
			first_map.get(first).add(map);//초성에 해당하는 배열에 맵형식의 값 추가
		}
		
		mv.addObject("first_map", first_map);
		return mv;
	}
	
	/** 23.01.19 나슬기: 시설 카테고리 등록 처리 메소드 */
	@PostMapping(value = "/cate/write")
	@ResponseBody
	public ResponseEntity<HttpStatus> cateReg(@RequestBody Map<String, Object> commandMap) throws Exception{
		int result = placeService.cateWrite(commandMap);
		if(result > 0) return new ResponseEntity<>(HttpStatus.OK);//정상적으로 삽입이 되었다면
		return new ResponseEntity<>(HttpStatus.EXPECTATION_FAILED);//417 에러코드
	}
	
	/** 23.01.19 나슬기: 시설 카테고리 수정 처리 메소드 */
	@PostMapping(value = "/cate/modify")
	@ResponseBody
	public ResponseEntity<HttpStatus> cateModi(@RequestBody Map<String, Object> commandMap) throws Exception{
		int result = placeService.cateModify(commandMap);
		if(result > 0) return new ResponseEntity<>(HttpStatus.OK);//정상적으로 수정이 되었다면
		return new ResponseEntity<>(HttpStatus.EXPECTATION_FAILED);//417 에러코드
	}
	
	/** 23.01.19 나슬기: 시설 카테고리 삭제 처리 메소드 */
	@PostMapping(value = "/cate/delete")
	@ResponseBody
	public ResponseEntity<HttpStatus> cateDelete(@RequestBody Map<String, Object> commandMap) throws Exception{
		int result = placeService.cateDelete(commandMap);
		if(result > 0) return new ResponseEntity<>(HttpStatus.OK);//정상적으로 삭제가 되었다면
		return new ResponseEntity<>(HttpStatus.EXPECTATION_FAILED);//417 에러코드
	}
}