package paw.togaether.together.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import paw.togaether.common.domain.CommandMap;
import paw.togaether.together.service.TogetherService;

@Controller
public class AdminTogeController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="togetherService")
	private TogetherService togetherService;
	
	/* 23.01.25 박선영 관리자 게시글 리스트 출력 */
	@RequestMapping(value="/admin/together/list.paw")
	public ModelAndView togetherList(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("/admin/together/togeAdminList");
		
		System.out.println(commandMap.getMap());//값을 잘 받아오는지 확인
		
		List<Map<String, Object>> list = togetherService.togetherList(commandMap.getMap());
		
		mv.addObject("list", list);
		
		return mv;
	}
	
	/* 23.01.25 박선영 관리자 게시글 카테고리 리스트 출력 */
	@RequestMapping(value="/admin/together/catelist.paw")
	public ModelAndView togetherCate(CommandMap commandMap) throws Exception {
	
		ModelAndView mv = new ModelAndView("/admin/together/togeAdminCateList");
		
		System.out.println(commandMap.getMap());
		
		List<Map<String, Object>> catelist = togetherService.togetherCate(commandMap.getMap());
		
		mv.addObject("catelist", catelist);
		
		return mv;
	}
	
	/* 23.01.25 박선영 관리자 카테고리 등록폼 */
	@RequestMapping(value="/admin/together/catewriteForm.paw")
	public ModelAndView openAdminTogeCateWrite(CommandMap commandMap) throws Exception {
		
		ModelAndView mv = new ModelAndView("/admin/together/togeAdminCateWrite");
		
		return mv;
	}
	
	/* 23.01.25 박선영 관리자 카테고리 등록 */
	@RequestMapping(value="/admin/together/catewrite.paw")
	public ModelAndView adminTogeCateWrite(CommandMap commandMap) throws Exception {
		
		System.out.println(commandMap.getMap());
		
		ModelAndView mv = new ModelAndView("redirect:/admin/together/catelist.paw");
		
		togetherService.adminTogeCateWrite(commandMap.getMap());
		
		return mv;
	}

}
