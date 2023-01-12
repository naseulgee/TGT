package paw.togaether.member.controller;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import paw.togaether.common.domain.CommandMap;
import paw.togaether.member.service.JoinService;

public class JoinController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="joinService")
	private JoinService joinService;
	
	@RequestMapping(value="/member/openMemberJoin.paw")
	public ModelAndView openMemberJoin(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("member/memberJoin");
	     
	    mv.addObject("error", commandMap.get("error"));
	     
	    return mv;
	}
	 
	@RequestMapping(value="/member/joinMember.paw")
	public ModelAndView joinMember(CommandMap commandMap) throws Exception{
	     
	    String error = joinService.joinMember(commandMap.getMap());
	    ModelAndView mv = null;;
	    if(error.equals("완료")) {
	        mv = new ModelAndView("redirect:/sample.paw");
	    }else {
	        mv = new ModelAndView("redirect:/member/openMemberJoin.paw");
	        mv.addObject("error", error);
	    }
	    return mv;
	}

}
