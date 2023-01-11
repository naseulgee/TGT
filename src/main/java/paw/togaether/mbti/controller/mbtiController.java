package paw.togaether.mbti.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import paw.togaether.common.domain.CommandMap;
import paw.togaether.mbti.service.mbtiService;

@Controller
//@RequestMapping(value = "/mbti")
public class mbtiController {
	
	@Resource(name = "mbtiService")
	private mbtiService mbtiService;

	Logger log = Logger.getLogger(this.getClass());
	
//	@RequestMapping(value = "/result/{")
	@RequestMapping(value = "/mbti")
	public ModelAndView mbti_test(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("/mbti/test");
		
		session = request.getSession(false);
		
		if(session != null) {
			mbtiService.mbti_modify(commandMap.getMap());
			return mv;
		} else {
			return mv;
		}
	}
	
/*	@RequestMapping(value = "/mbti/result")
	public ModelAndView mbti_result(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView("mbti_result");
		
//		String ID = (String) session.getAttribute("loginId");
//		commandMap.getMap().put("ID", ID);
		
		return mv;
	}*/
}
