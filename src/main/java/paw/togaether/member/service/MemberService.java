package paw.togaether.member.service;

import javax.servlet.http.HttpSession;
import java.util.Map;

public interface MemberService {
    Map<String, Object> myInfo(Map<String, Object> map, HttpSession session) throws Exception;
}
