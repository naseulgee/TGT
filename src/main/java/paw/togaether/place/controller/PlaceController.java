package paw.togaether.place.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
@RequestMapping("/place")
public class PlaceController {
	Logger log = Logger.getLogger(this.getClass());
	
	//시설, 시설 카테고리, 시설 메뉴 관련 서비스
	@Resource(name="placeService")
	private PlaceService placeService;
	//리뷰 관련 서비스
	@Resource(name="reviewService")
	private ReviewService reviewService;
	
	/** 23.01.30 나슬기: 시설 리스트 메소드 */
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
	
	/** 23.01.22 나슬기: 시설 상세보기 메소드 */
	@RequestMapping("/detail/{pl_idx}")
	public ModelAndView placeDetail(@PathVariable("pl_idx") int cafe_idx) throws Exception{
		ModelAndView mv = new ModelAndView("/place/detail");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pl_idx", cafe_idx);
		map.put("ph_board_type", "place");
		mv.addObject("detail", placeService.placeDetail(map));
		mv.addObject("menu", placeService.menuList(map));
		mv.addObject("review_avg", reviewService.openReviewInfo(map));
		mv.addObject("review_list", reviewService.openFiveReviews(map));
		return mv;
	}
	
	/** 23.01.22 나슬기: 시설 등록/수정 폼 메소드 */
	@RequestMapping(value={"/writeForm", "/modifyForm"})
	public ModelAndView placeRegForm(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/place/writeForm");
		//카테고리 리스트 불러오기
		mv.addObject("cate_list", placeService.cateList(commandMap.getMap()));
		//idx값을 넘겨받았다면 수정할 상세 정보 불러오기
		if(commandMap.get("pl_idx") != null) mv.addObject("detail", placeService.placeDetail(commandMap.getMap()));
		return mv;
	}
	/** 23.01.22 나슬기: 시설 등록/수정 처리 메소드
	 * 23.01.26 나슬기: 사진 등록 관련 로직 추가
	 * 23.02.03 나슬기: 휴무일 처리 로직을 형변환 오류때문에 String[]을 Object[]로 변환. */
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
			return new ResponseEntity<String>("/place/detail/"+idx+".paw",HttpStatus.OK);
		}catch(Exception e) { e.printStackTrace(); }
		return null;
	}
	
	/** 23.01.13 나슬기: 시설 삭제요청 처리 메소드
	 * 23.02.07 나슬기: Ajax를 이용한 처리를 위해 리턴타입 변경 */
	@PostMapping(value = "/delete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<HttpStatus> placeDeleteReq(@RequestBody Map<String, Object> commandMap) {
		try {
			placeService.placeDeleteReq(commandMap);
		}catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.EXPECTATION_FAILED);
		}
		return new ResponseEntity<>(HttpStatus.OK);//정상적으로 삽입이 되었다면
	}
	
	//시설 메뉴 관련
	/** 23.02.07 나슬기: 시설 메뉴 등록 처리 메소드 */
	@PostMapping(value = "/menu/write", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<Integer> menuReg(@RequestBody Map<String, Object> commandMap) {
		int result;
		try {
			placeService.menuWrite(commandMap);
			result = Integer.parseInt(commandMap.get("PM_IDX_NEXT").toString());
		}catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.EXPECTATION_FAILED);
		}
		return new ResponseEntity<>(result, HttpStatus.OK);//정상적으로 삽입이 되었다면
	}
	
	/** 23.02.07 나슬기: 시설 메뉴 수정 처리 메소드 */
	@PostMapping(value = "/menu/modify", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<HttpStatus> menuModi(@RequestBody Map<String, Object> commandMap) {
		try {
			placeService.menuModify(commandMap);
		}catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.EXPECTATION_FAILED);
		}
		return new ResponseEntity<>(HttpStatus.OK);//정상적으로 삽입이 되었다면
	}
	
	/** 23.02.07 나슬기: 시설 메뉴 삭제 처리 메소드 */
	@PostMapping(value = "/menu/delete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<HttpStatus> menuDelete(@RequestBody Map<String, Object> commandMap) {
		try {
			placeService.menuDelete(commandMap);
		}catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.EXPECTATION_FAILED);
		}
		return new ResponseEntity<>(HttpStatus.OK);//정상적으로 삽입이 되었다면
	}
}