package paw.togaether.together.controller;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
	@RequestMapping(value="/together/list.paw")
	public ModelAndView togetherList(CommandMap commandMap) throws Exception { 
		
		//ModelAndView 객체 생성 후 데이터를 넘길 페이지의 값 지정
		ModelAndView mv = new ModelAndView("/together/togetherList"); 
		
		//서비스의 togetherList 메소드의 결과 map 형태의 resultMap 변수에 저장
		List<Map<String, Object>> list = togetherService.togetherList(commandMap.getMap());
		
			System.out.println(commandMap.getMap());
		
		//get()으로 받은 commandMap의 값들을 mv에 ""이름으로 저장
		//mv.addObject("search_type", commandMap.get("search_type"));
		//mv.addObject("search_keyword", commandMap.get("search_keyword"));
		mv.addObject("list", list);
		
		return mv;		
	}
	
	//23.01.16 박선영 : 게시글 작성 폼으로의 이동 
	@RequestMapping(value="/together/writeForm.paw")
	public ModelAndView openTogetherWrite(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("/together/togetherWrite");
		
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
		
		mv.addObject(commandMap.get("TC_NAME"));
		mv.addObject("catelist",catelist);
		
		return mv;
	}
}
