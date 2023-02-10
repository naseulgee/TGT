package paw.togaether.member.service;

import javax.servlet.http.HttpSession;
import java.util.Map;

public interface LoginService {
    /** 로그인 */
    Map<String, Object> Login(Map<String, Object> map) throws Exception;

    /** 아이디 찾기 */
    Map<String, Object> findID(Map<String, Object> map) throws Exception;

    /** 비밀번호찾기시 가입한 이메일주소로 인증번호 전송 */
    Map<String, Object> selectMemberInfo(Map<String, Object> map, HttpSession session) throws Exception;

    /** 비밀번호찾기 인증번호 검증 */
    Map<String, Object> isNumCorrect(Map<String, Object> map, HttpSession session) throws Exception;

    /** 인증번호 검증 후 새 비밀번호 설정 */
    void setNewPassword(Map<String, Object> map, HttpSession session) throws Exception;

    /** 카카오로그인 토큰 받아오기 */
    String getAccessToken(String code) throws Exception;

    /** 카카오 회원정보 불러오기 */
    Map<String,Object> getUserInfo(String access_token) throws Exception;

    /** 이메일로 DB에있는 회원정보 불러오기*/
    Map<String,Object> findEmail(Map<String,Object>map) throws Exception;

    /** 카카오 로그아웃 */
    void socialLogout(String accessToken) throws Exception;

}
