package paw.togaether.member.dao;

import org.springframework.stereotype.Repository;
import paw.togaether.common.dao.AbstractDAO;

import java.util.Map;
@Repository("loginDAO")
public class LoginDAO extends AbstractDAO {

    /** 로그인 */
    public Object login(Map<String, Object> map) throws Exception {

        return selectOne("login.MemberLogin", map);
    }

    /** 아이디 찾기 */
    public Object findID(Map<String, Object> map) throws Exception {

        return selectOne("login.findID", map);
    }

    /** 비밀번호찾기시 입려한 id, email주소가  일치하는지 확인 */
    public Map<String, Object> selectMemberInfo(Map<String, Object> map) throws Exception{

        return (Map<String, Object>) selectOne("login.selectMemberInfo", map);
    }

    /** 비밀번호찾기 인증 성공시 새 비밀번호 설정 */
    public void setNewPassword(Map<String, Object> map) throws Exception{

        update("login.setNewPassword", map);
    }

    public Object findEmail(Map<String,Object> map) throws Exception {

        return selectOne("login.findEmail", map);
    }
}

