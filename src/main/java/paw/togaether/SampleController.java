package paw.togaether;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import paw.togaether.common.domain.CommandMap;

@Controller
public class SampleController {
	Logger log = Logger.getLogger(this.getClass());
	
	//임시 메인
	@RequestMapping("/main")
	public String main() { return "redirect:/sample.paw"; }
	
	/* 작업날짜 작업자: 메소드 설명
	 * 23.01.10 나슬기: 샘플 UI를 보기 위한 컨트롤러
	 * 수정사항이 있다면 밑에 똑같이, 작업날짜 작업자: 메소드 설명 적기
	 * */
	@RequestMapping("/sample")
	public ModelAndView sample(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("/sample");
		
		//주석을 달아놓으면.. 다른 팀원에게도, 미래의 나에게도 편함
		mv.addObject("search_type", commandMap.get("search_type"));
		mv.addObject("search_keyword", commandMap.get("search_keyword"));
		return mv;
	}
	@RequestMapping(value={"/sample/{page}", "{page}/sample"})
	public ModelAndView sample(@PathVariable String page, CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("/sample");
		
		mv.addObject("search_type", commandMap.get("search_type"));
		mv.addObject("search_keyword", commandMap.get("search_keyword"));
		mv.addObject("page", page);
		return mv;
	}
}