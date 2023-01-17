package paw.togaether.member.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import paw.togaether.common.domain.CommandMap;
import paw.togaether.member.service.JoinService;

@Controller
public class JoinController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="joinService")
	private JoinService joinService;
	
	@RequestMapping(value="/member/openMemberJoin")
	public ModelAndView openMemberJoin(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("/member/memberJoin");
	     
	    return mv;
	}
	 
	@RequestMapping(value="/member/joinMember")
	public ModelAndView joinMember(CommandMap commandMap) throws Exception{	
		ModelAndView mv = new ModelAndView("redirect:/sample.paw");
		
		joinService.joinMember(commandMap.getMap());
	    
	    return mv;
	}

}
