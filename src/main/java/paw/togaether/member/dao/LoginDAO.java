package paw.togaether.member.dao;

import org.springframework.stereotype.Repository;
import paw.togaether.common.dao.AbstractDAO;

import java.util.Map;
@Repository("loginDAO")
public class LoginDAO extends AbstractDAO {

    public Object login(Map<String, Object> map) throws Exception {

        return selectOne("login.MemberLogin", map);
    }

    public Object findID(Map<String, Object> map) throws Exception {

        return selectOne("login.findID", map);
    }

    public Map<String, Object> selectMemberInfo(Map<String, Object> map) throws Exception{

        return (Map<String, Object>) selectOne("login.selectMemberInfo", map);
    }
}

