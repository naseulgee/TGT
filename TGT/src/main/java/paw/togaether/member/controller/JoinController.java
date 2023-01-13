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
	    if(error.equals("완료")) {   //회원가입 성공시
	        mv = new ModelAndView("redirect:/sample.paw");	//메인화면으로 리다이렉트
	    }else {	//아이디, 이메일이 중복된다면 
	        mv = new ModelAndView("redirect:/member/openMemberJoin.paw");	//다시 회원가입 페이지로 리다이렉트
	        mv.addObject("error", error);
	    }
	    return mv;
	}

}
