package paw.togaether.common.interceptor;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthInterceptor extends HandlerInterceptorAdapter {
    Logger log = Logger.getLogger(this.getClass());

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        String mem_id = (String)session.getAttribute("mem_id");
        int mem_type = -1; // 초기 값 설정 ( -1 은 회원 타입이 admin도 일반 유저도 SNS가입유저도 아닌 로그인 하지 않는 유저)

        if(session.getAttribute("mem_type") != null){
            mem_type = Integer.parseInt(session.getAttribute("mem_type").toString());
        }

        String requestURI = request.getRequestURI();
        //:TODO 추후 에러페이지로 리다이렉트 예정
        if(mem_type != 0 && requestURI.contains("admin")) {
            response.sendRedirect("/main.paw");
        }

        if((requestURI.contains("detail") || requestURI.contains("write") || requestURI.contains("mypage")) && mem_id == null) {
        response.sendRedirect("/member/login.paw");
        session.setAttribute("prev_url", requestURI);
        return false;
        }

        return true;
    }
}
