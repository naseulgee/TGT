package paw.togaether.member.dao;

import org.springframework.stereotype.Repository;
import paw.togaether.common.dao.AbstractDAO;

import java.util.Map;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO {
    public Object selectMyInfo(Map<String, Object> map) throws Exception {
        return selectOne("member.selectMyInfo", map);
    }

}
