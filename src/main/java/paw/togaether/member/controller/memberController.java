package paw.togaether.member.controller;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import paw.togaether.common.domain.CommandMap;
import paw.togaether.member.service.JoinService;
import paw.togaether.member.service.MemberService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class memberController {
    Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "joinService")
    private JoinService joinService;

    @Resource(name = "memberService")
    private MemberService memberService;

    /** 마이페이지-나의정보 */
    @GetMapping(value = "/mypage/myInfo")
    public ModelAndView myInfo(CommandMap commandMap, HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView("/mypage/member/myInfo");

        Map<String, Object> selectedMyInfo = memberService.myInfo(commandMap.getMap(), session);

        for (String key : selectedMyInfo.keySet()) {
            mv.addObject(key, selectedMyInfo.get(key));
        }

        return mv;
    }

    /** 회원정보 수정페이지 */
    @GetMapping(value = "/mypage/modifyMyInfo")
    public ModelAndView modifyMyInfo(Map<String, Object> commandMap, HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView("/mypage/member/modifyMyInfo");

        List<Map<String, Object>> dogList = joinService.listOfDog(commandMap);
        mv.addObject("dogList", dogList);

        Map<String, Object> infoForModify = memberService.infoForModify(commandMap, session);

        for (String key : infoForModify.keySet()) {
            mv.addObject(key, infoForModify.get(key));
        }

        return mv;

    }

    /** 회원정보 수정 */
    @PostMapping(value = "/mypage/modifyMyInfo")
    public ModelAndView postModifyMyInfo(CommandMap commandMap, HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView("/mypage/member/newInfo");

        memberService.modifyMyInfo(commandMap.getMap(), session);

        return mv;
    }

    /** 사진변경 */
    @PostMapping(value = "/mypage/changePhoto")
    public ModelAndView changePhoto(CommandMap commandMap, HttpSession session, MultipartFile[] uploadFile) throws Exception {
        ModelAndView mv = new ModelAndView("jsonView");
        memberService.changePhoto(commandMap.getMap(), session, uploadFile);
        mv.setStatus(HttpStatus.OK);

        return mv;
    }

    /** 사진삭제 */
    @DeleteMapping(value = "/mypage/deletePhoto")
    public ModelAndView deletePhoto(CommandMap commandMap) throws Exception {
        ModelAndView mv = new ModelAndView("jsonView");
        memberService.deletePhoto(commandMap.getMap());
        mv.setStatus(HttpStatus.OK);

        return mv;
    }

    /** 회원탈퇴 */
    @DeleteMapping(value = "/mypage/deleteMyInfo")
    public ResponseEntity<String> deleteMyInfo(CommandMap commandMap, HttpSession session) throws Exception {

        memberService.deleteMyInfo(commandMap.getMap(), session);

        session.invalidate();

        return new ResponseEntity(HttpStatus.OK);
    }


}
