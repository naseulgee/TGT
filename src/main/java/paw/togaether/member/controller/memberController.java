package paw.togaether.member.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import paw.togaether.common.domain.CommandMap;
import paw.togaether.member.service.MemberService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class memberController {
    Logger log = Logger.getLogger(this.getClass());

    @Resource(name="memberService")
    private MemberService memberService;

    /** 마이페이지-나의정보 */
    @GetMapping(value = "/mypage/myInfo")
    public ModelAndView myInfo(CommandMap commandMap, HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView("/mypage/member/myInfo");

        Map<String, Object> selectedMyInfo = memberService.myInfo(commandMap.getMap(), session);

        for( String key : selectedMyInfo.keySet() ){
            mv.addObject(key, selectedMyInfo.get(key));
        }

        return mv;
    }

}
