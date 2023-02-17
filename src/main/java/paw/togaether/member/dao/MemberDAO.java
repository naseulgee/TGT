package paw.togaether.member.dao;

import org.springframework.stereotype.Repository;
import paw.togaether.common.dao.AbstractDAO;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Repository("memberDAO")
public class MemberDAO extends AbstractDAO {
    public Object selectMyInfo(Map<String, Object> map) throws Exception {
        return selectOne("member.selectMyInfo", map);
    }

    public void modifyMyInfo(Map<String, Object> map, HttpSession session) throws Exception {
        update("member.modifyMyInfo", map);
    }

    public void deleteMyInfo(Map<String, Object> map, HttpSession session) throws Exception {
        update("member.deleteMyInfo", map);
    }
}
