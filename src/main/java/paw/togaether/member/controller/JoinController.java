package paw.togaether.member.controller;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import paw.togaether.common.domain.CommandMap;
import paw.togaether.member.service.JoinService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
public class JoinController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="joinService")
	private JoinService joinService;


	/** 회원가입 폼 */
	@RequestMapping(value="/member/openMemberJoin")
	public ModelAndView openMemberJoin(Map<String,Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/memberJoin");

		List<Map<String,Object>> dogList = joinService.listOfDog(commandMap);

		mv.addObject("dogList", dogList);

		return mv;

	}

	/** 회원가입 완료 후 메인페이지로 이동(로그인페이지 구현 시 추후 로그인화면으로 리다이렉트 예정) */
	@RequestMapping(value="/member/joinMember")
	public ModelAndView joinMember(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/sample.paw");

		joinService.joinMember(commandMap.getMap());

	    return mv;
	}

	/** 아이디 중복확인 */
	@GetMapping(value = "/idCheck")
	public ModelAndView idCheck(String id) throws Exception{
		int result = joinService.idCheck(id);
		ModelAndView mv = new ModelAndView("jsonView");
		if(result == 0){
			mv.addObject("result", "사용가능한 아이디입니다.");
			mv.setStatus(HttpStatus.OK);
		} else {
			mv.addObject("result", "중복된 아이디입니다.");
			mv.setStatus(HttpStatus.CONFLICT);
		}


		return mv;
		}



}
