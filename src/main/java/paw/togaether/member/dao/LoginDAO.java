package paw.togaether.member.dao;

import org.springframework.stereotype.Repository;
import paw.togaether.common.dao.AbstractDAO;

import java.util.Map;
@Repository("loginDAO")
public class LoginDAO extends AbstractDAO {

    public Object login(Map<String, Object> map) {

        return selectOne("login.MemberLogin", map);
    }
}

