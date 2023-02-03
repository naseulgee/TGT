package paw.togaether.member.service;

import javax.servlet.http.HttpSession;
import java.util.Map;

public interface LoginService {
    Map<String, Object> Login(Map<String, Object> map) throws Exception;

    Map<String, Object> findID(Map<String, Object> map) throws Exception;


    Map<String, Object> selectMemberInfo(Map<String, Object> map, HttpSession session) throws Exception;
}
