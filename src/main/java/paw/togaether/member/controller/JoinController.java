package paw.togaether.member.controller;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import paw.togaether.common.domain.CommandMap;
import paw.togaether.member.service.JoinService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class JoinController {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="joinService")
	private JoinService joinService;


	/** 회원가입 */
	@RequestMapping(value="/member/openMemberJoin")
	public ModelAndView openMemberJoin(Map<String,Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/member/memberJoin");

		List<Map<String,Object>> dogList = joinService.listOfDog(commandMap);

		mv.addObject("dogList", dogList);

		return mv;

	}

	@RequestMapping(value="/member/joinMember")
	public ResponseEntity<String> joinMember(CommandMap commandMap, HttpSession session, MultipartFile[] uploadFile) throws Exception{

		joinService.joinMember(commandMap.getMap(), session, uploadFile);

		return new ResponseEntity<String>("/member/login",HttpStatus.OK);

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

	/** 이메일 중복확인 */
	@GetMapping(value = "/emailCheck")
	public ModelAndView emailCheck(String email) throws Exception{
		int result = joinService.emailCheck(email);
		ModelAndView mv = new ModelAndView("jsonView");
		if(result == 0){
			mv.addObject("result", "사용가능한 이메일 주소입니다.");
			mv.setStatus(HttpStatus.OK);
		} else {
			mv.addObject("result", "중복된 이메일 주소입니다.");
			mv.setStatus(HttpStatus.CONFLICT);
		}
		return mv;
	}





}
