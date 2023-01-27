package paw.togaether.together.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import paw.togaether.common.domain.CommandMap;
import paw.togaether.together.service.TogetherService;

@Controller
public class TogetherController {
	Logger log = Logger.getLogger(this.getClass());
	
	//togetherService의 빈 객체에 의존
	@Resource(name="togetherService")
	private TogetherService togetherService;
	
	/* 23.01.12 박선영 : 함께해요 전체 게시판 리스트와 검색 메소드 작성 */
	/* 23.01.25 박선영 : 함께해요 카테고리 수정 반영 */
	@RequestMapping(value="/together/list.paw")
	public ModelAndView togetherList(CommandMap commandMap) throws Exception { 
		
		//ModelAndView 객체 생성 후 데이터를 넘길 페이지의 값 지정
		ModelAndView mv = new ModelAndView("/together/togetherList"); 
		
		//서비스의 togetherList 메소드의 결과 map 형태의 resultMap 변수에 저장
		List<Map<String, Object>> list = togetherService.togetherList(commandMap.getMap());
		/* 분류별 넘겨주는 데이터를 다르게 하기 위함 */
		List<Map<String, Object>> catelist = togetherService.togetherCate(commandMap.getMap());
		//참여인원수를 구하기 위함
		
 		int join = togetherService.togetherJoinCount(commandMap.getMap());
		
		System.out.println(join);
		System.out.println(commandMap.getMap());
		
		//get()으로 받은 commandMap의 값들을 mv에 ""이름으로 저장
		//mv.addObject("search_type", commandMap.get("search_type"));
		//mv.addObject("search_keyword", commandMap.get("search_keyword"));
		mv.addObject("join", join);
		mv.addObject("catelist", catelist);
		mv.addObject("list", list);
		
		return mv;		
	}
	
	//23.01.16 박선영 : 게시글 작성 폼으로의 이동 
	@RequestMapping(value="/together/writeForm.paw")
	public ModelAndView openTogetherWrite(CommandMap commandMap) throws Exception {
		
		System.out.println(commandMap.getMap());
		
		ModelAndView mv = new ModelAndView("/together/togetherWrite");
		
		/* 견종분류 셀렉트 박스 만들용도 */
		List<Map<String, Object>> brlist = togetherService.togetherbreed(commandMap.getMap());
		/* 카테고리 분류 셀렉트박스 만들용도 */
		List<Map<String, Object>> catelist = togetherService.togetherCate(commandMap.getMap());
		
		mv.addObject("catelist", catelist);
		mv.addObject("brlist", brlist);
		return mv;
	}
	//23.01.16 박선영 : 작성한 게시글 insert 하기
	@RequestMapping(value="/together/write.paw")
	public ModelAndView togetherWrite(CommandMap commandMap) throws Exception {
		System.out.println(commandMap.getMap());
		//작성폼 작성 후 게시글 리스트로 리다이렉트
		ModelAndView mv = new ModelAndView("redirect:/together/list.paw");
		
		togetherService.togetherWrite(commandMap.getMap());
		
		return mv;
	}
	
	/* 23.01.18 박선영 : 게시글 상세보기 이동 */
	@RequestMapping(value="/together/detail/{to_idx}.paw")
	public ModelAndView togetherDetail(@PathVariable("to_idx") int TO_IDX, CommandMap commandMap)throws Exception {
		
		//값을 잘 받아오는지 확인하는 용도
		System.out.println(TO_IDX);
		System.out.println(commandMap.getMap());
		
		ModelAndView mv = new ModelAndView("/together/togetherDetail");
		
		Map<String, Object> map = togetherService.togetherDetail(commandMap.getMap());
		List<Map<String, Object>> withlist = togetherService.togetherWithList(commandMap.getMap());//참여자 리스트 메소드
		
		mv.addObject("withlist", withlist);
		mv.addObject("map", map);
		
		return mv;
		
	}
	
	/*23.01.19 박선영: 카테고리별 리스트 출력 */
	@RequestMapping(value="/together/catelist.paw")
	public ModelAndView togetherCateList(CommandMap commandMap) throws Exception {
		
		System.out.println(commandMap.getMap());
		System.out.println(commandMap.get("TC_NAME"));
		
		ModelAndView mv = new ModelAndView("/together/togetherCateList");
				
		List<Map<String, Object>> catelist = togetherService.togetherCateList(commandMap.getMap());
		//카테고리별 리스트도 버튼이 따라다녀야하기 때문
		List<Map<String, Object>> cate = togetherService.togetherCate(commandMap.getMap());
		
		mv.addObject("cate", cate);
		mv.addObject(commandMap.get("TC_NAME"));
		mv.addObject("catelist",catelist);
		
		return mv;
	}
	
	/* 23.01.20 박선영 게시글 수정폼 */
	/* 23.01.25 카테고리 분류 리스트 추가 */
	@RequestMapping(value="/together/modifyForm.paw")
	public ModelAndView openTogetherModi(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/together/togetherModi");
		
		System.out.println(commandMap.getMap());
		
		//이미 써놨던 게시글 상세정보를 불러옴
		Map<String, Object> map = togetherService.togetherDetail(commandMap.getMap());
		/* 견종분류 셀렉트 박스 만들용도 */
		List<Map<String, Object>> brlist = togetherService.togetherbreed(commandMap.getMap());
		/* 카테고리 분류 셀렉트박스 만들용도 */
		List<Map<String, Object>> catelist = togetherService.togetherCate(commandMap.getMap());
		
		mv.addObject("catelist", catelist);
		mv.addObject("brlist", brlist);
		mv.addObject("map",map);
		
		return mv;
	}
	
	/* 23.01.20 박선영 게시글 수정하기 */
	@RequestMapping(value="/together/modify.paw", method = RequestMethod.POST)
	public ModelAndView togetherModi(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/together/list.paw");
		
		System.out.println(commandMap.get("TO_IDX"));
		
		togetherService.togetherModi(commandMap.getMap());
		mv.addObject("TO_IDX", commandMap.get("TO_IDX"));
		
		return mv;
	}
	
	/* 23.01.23 박선영 게시글 삭제하기 */
	@RequestMapping(value="/together/delete.paw", method = RequestMethod.POST)
	public ModelAndView togetherDel(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/together/list.paw");
		
		System.out.println(commandMap.get("TO_IDX"));
		
		togetherService.togetherDel(commandMap.getMap());
		
		return mv;
	}
	
}
