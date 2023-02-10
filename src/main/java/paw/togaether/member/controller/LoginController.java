package paw.togaether.member.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    /** 로그인 페이지 */
    @GetMapping(value="/member/login")
    public ModelAndView getLogin(CommandMap commandMap) throws Exception {
        ModelAndView mv = new ModelAndView("/member/Login");

        return mv;
    }

    /** 로그인 */
    @PostMapping(value="/member/login")
    public ModelAndView postLogin(CommandMap commandMap, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();

        Map<String, Object> userdata = loginService.Login(commandMap.getMap());
        boolean isloginsuccess = (boolean) userdata.get("isloginsuccess");
        //세션에 값 넣기
        if(isloginsuccess) {
            HttpSession session = request.getSession();
            String mem_id = userdata.get("MEM_ID").toString();
            String mem_dog_name = userdata.get("MEM_DOG_NAME").toString();
            String mem_addr = userdata.get("MEM_ADDR").toString();
            String mem_dog_weight = userdata.get("MEM_DOG_WEIGHT").toString();
            String mem_type = userdata.get("MEM_TYPE").toString();
            session.setAttribute("mem_id", mem_id);
            session.setAttribute("mem_dog_name", mem_dog_name);
            session.setAttribute("mem_addr", mem_addr);
            session.setAttribute("mem_dog_weight", mem_dog_weight);
            session.setAttribute("mem_type", mem_type);
            session.setMaxInactiveInterval(3600);

            String prev_url = (String)session.getAttribute("prev_url");   //인터셉터에 걸렸을 때 로그인처리 후 이전에 보던 페이지로 이동
            if(prev_url == null) {
                mv.setViewName("redirect:/sample");
            } else {
                mv.setViewName("redirect:"+prev_url);
            }



        } else {
            mv.addObject("errorMessage", "아이디 또는 비밀번호가 틀렸습니다."); //에러페이지에 메세지를 불러와 출력
            mv.setViewName("/member/errorPage");
        }

        return mv;

    }


    /** 아이디 찾기 페이지*/
    @GetMapping(value="/member/findID")
    public ModelAndView findID(CommandMap commandMap) throws Exception {
        ModelAndView mv = new ModelAndView("/member/findID");

        return mv;
    }


    /** 아이디 찾기 */
    @PostMapping(value="/member/findID")
    public ModelAndView postfindID(CommandMap commandMap) throws Exception {
        ModelAndView mv = new ModelAndView();

        Map<String, Object> toFindID = loginService.findID(commandMap.getMap());
        boolean dataExists = (boolean)toFindID.get("dataExists");

        if(dataExists) {
            mv.addObject("ID", toFindID.get("MEM_ID"));
            mv.setViewName("redirect:/member/foundID");
        } else {
            mv.addObject("errorMessage", "회원가입시 입력했던 이메일주소가 아닙니다.");
            mv.setViewName("/member/errorPage");
        }

        return mv;

    }

    /** 아이디찾기 성공시 아이디 보여주기 */
    @GetMapping(value="/member/foundID")
    public ModelAndView foundID() throws Exception{
        ModelAndView mv = new ModelAndView("/member/foundID");

        return mv;
    }

    /** 비밀번호 찾기 페이지*/
    @GetMapping(value="/member/findPassword")
    public ModelAndView findPassword() throws Exception{
        ModelAndView mv = new ModelAndView("/member/findPassword");

        return mv;
    }

    /** 비밀번호 찾기 */
    @PostMapping (value = "/member/passwordAuth")
    public ModelAndView passwordAuth(CommandMap commandMap, HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView();

        Map<String, Object> memberInfo = loginService.selectMemberInfo(commandMap.getMap(), session);
        boolean dataExists = (boolean) memberInfo.get("dataExists");

        if(dataExists){
           session.setAttribute("num", memberInfo.get("num"));          //메일로 전송된 임의의 번호 세션에 저장
           session.setAttribute("before", System.currentTimeMillis());  //세션에 메일이 전송된 시점의 시간 저장

           mv.setViewName("/member/passwordAuth");
        } else {
            mv.addObject("errorMessage", "올바르지 않은 ID 또는 이메일주소입니다.");
            mv.setViewName("/member/errorPage");
        }

        return mv;
    }

    /** 비밀번호 찾기 인증번호 입력페이지 */
    @GetMapping(value="/member/passwordAuth")
    public ModelAndView passwordAuth() throws Exception{
        ModelAndView mv = new ModelAndView("/member/passwordAuth");

        return mv;
    }

    /** 비밀번호 찾기 인증 후 새 비밀번호 설정 */
    @PostMapping(value="/member/setPassword")
    public ModelAndView setPassword(CommandMap commandMap,HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView();

        Map<String, Object> AuthNum = loginService.isNumCorrect(commandMap.getMap(), session);
        boolean isNumCorrect = (boolean)AuthNum.get("isNumCorrect");

        long before = (long)session.getAttribute("before");
        long after = System.currentTimeMillis ();
        long interval = (long)((after -before) / 1000.0);
        //메일이 전송된 시점에서 3분이 지나면 인증번호 무효화
        if(interval < 180) {
            if(isNumCorrect) {
                mv.setViewName("/member/setNewPassword");
            } else {
                session.removeAttribute("num");
                session.removeAttribute("before");
                mv.addObject("errorMessage", "인증번호가 틀렸습니다.");
                mv.setViewName("/member/errorPage");
            }
            return mv;
        } else {
            session.removeAttribute("num");
            session.removeAttribute("before");
            mv.addObject("errorMessage", "인증번호 유효시간이 지났습니다. <br> 비밀번호 찾기를 다시 시도해주세요.");
            mv.setViewName("/member/errorPage");
        }

        return mv;
    }

    /** 비밀번호찾기 인증번호 입력 후 새 비밀번호 설정 페이지*/
    @GetMapping(value="/member/setNewPassword")
    public ModelAndView setNewPassword() throws Exception {
        ModelAndView mv = new ModelAndView("/member/setNewPassword");

        return mv;
    }

    /** 비밀번호찾기 인증번호 입력 후 새 비밀번호 설정 */
    @PostMapping(value="/member/postsetNewPassword")
    public ModelAndView postsetNewPassword(CommandMap commandMap, HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView("/member/succesSetNewPassword");

        loginService.setNewPassword(commandMap.getMap(), session);

        return mv;
    }

    /** 로그아웃 */
    @GetMapping(value="/member/logout")
    public ModelAndView logout(HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView("/member/Login");

        String access_token = (String)session.getAttribute("access_token");

        if(access_token != null) {
            loginService.socialLogout(access_token);
        }
        session.invalidate();

        return mv;
    }

    /** 카카오로그인 */
    @GetMapping(value = "/member/socialLogin")
    public ModelAndView socialLogin(@RequestParam("code")String code, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();

        String access_token = loginService.getAccessToken(code);
        Map<String,Object> userInfo = loginService.getUserInfo(access_token);

        Map<String,Object> userdata = loginService.findEmail(userInfo);

        if(userdata == null) {
            mv.addObject("errorMessage", "회원정보가 존재하지 않습니다.");
            mv.setViewName("/member/errorPage");
        } else {
            HttpSession session = request.getSession();
            String mem_id = userdata.get("MEM_ID").toString();
            String mem_dog_name = userdata.get("MEM_DOG_NAME").toString();
            String mem_addr = userdata.get("MEM_ADDR").toString();
            String mem_dog_weight = userdata.get("MEM_DOG_WEIGHT").toString();
            String mem_type = userdata.get("MEM_TYPE").toString();
            session.setAttribute("mem_id", mem_id);
            session.setAttribute("mem_dog_name", mem_dog_name);
            session.setAttribute("mem_addr", mem_addr);
            session.setAttribute("mem_dog_weight", mem_dog_weight);
            session.setAttribute("mem_type", mem_type);
            session.setAttribute("access_token", access_token);
            session.setMaxInactiveInterval(3600);

            String prev_url = (String)session.getAttribute("prev_url");   //인터셉터에 걸렸을 때 로그인처리 후 이전에 보던 페이지로 이동
            if(prev_url == null) {
                mv.setViewName("redirect:/sample");
            } else {
                mv.setViewName("redirect:"+prev_url);
            }

        }

        return mv;

    }


}






