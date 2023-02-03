package paw.togaether.member.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import paw.togaether.common.domain.CommandMap;
import paw.togaether.member.service.LoginService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class LoginController {
    Logger log = Logger.getLogger(this.getClass());

    @Resource(name="loginService")
    private LoginService loginService;

    /** 로그인 */
    @GetMapping(value="/member/login")
    public ModelAndView getLogin(CommandMap commandMap) throws Exception {
        ModelAndView mv = new ModelAndView("/member/Login");

        return mv;
    }

    @PostMapping(value="/member/login")
    public ModelAndView postLogin(CommandMap commandMap, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();

        Map<String, Object> userdata = loginService.Login(commandMap.getMap());
        boolean isloginsuccess = (boolean) userdata.get("isloginsuccess");

        if(isloginsuccess) {
            HttpSession session = request.getSession();
            String mem_id = userdata.get("MEM_ID").toString();
            String mem_dog_name = userdata.get("MEM_DOG_NAME").toString();
            String mem_addr = userdata.get("MEM_ADDR").toString();
            String mem_dog_weight = userdata.get("MEM_DOG_WEIGHT").toString();
            session.setAttribute("mem_id", mem_id);
            session.setAttribute("mem_dog_name", mem_dog_name);
            session.setAttribute("mem_addr", mem_addr);
            session.setAttribute("mem_dog_weight", mem_dog_weight);
            session.setMaxInactiveInterval(3600);

            mv.setViewName("redirect:/sample");


        } else {
            mv.setViewName("redirect:/member/loginError");
        }

        return mv;

    }

    @GetMapping(value="/member/loginError")
    public ModelAndView loginError() throws Exception{
        ModelAndView mv = new ModelAndView("/member/loginError");

        return mv;
    }

    /** 아이디 찾기*/
    @GetMapping(value="/member/findID")
    public ModelAndView findID(CommandMap commandMap) throws Exception {
        ModelAndView mv = new ModelAndView("/member/findID");

        return mv;
    }


    @PostMapping(value="/member/findID")
    public ModelAndView postfindID(CommandMap commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        Map<String, Object> toFindID = loginService.findID(commandMap.getMap());
        boolean dataExists = (boolean)toFindID.get("dataExists");

        if(dataExists) {
            mv.addObject("ID", toFindID.get("MEM_ID"));
            mv.setViewName("redirect:/member/foundID");
        } else {
            mv.setViewName("redirect:/member/findIDError");
        }

        return mv;

    }

    @GetMapping(value="/member/foundID")
    public ModelAndView foundID() throws Exception{
        ModelAndView mv = new ModelAndView("/member/foundID");

        return mv;
    }

    @GetMapping(value="/member/findIDError")
    public ModelAndView findIDError() throws Exception{
        ModelAndView mv = new ModelAndView("/member/findIDError");

        return mv;
    }

    /** 비밀번호 찾기*/
    @GetMapping(value="/member/findPassword")
    public ModelAndView findPassword() throws Exception{
        ModelAndView mv = new ModelAndView("/member/findPassword");

        return mv;
    }

    @PostMapping (value = "/member/passwordAuth")
    public ModelAndView passwordAuth(CommandMap commandMap, HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView();

        Map<String, Object> memberInfo = loginService.selectMemberInfo(commandMap.getMap(), session);
        boolean dataExists = (boolean) memberInfo.get("dataExists");

        if(dataExists){
           mv.setViewName("/member/passwordAuth");
        } else {
            mv.setViewName("/member/failed");
        }

        return mv;
    }
}




