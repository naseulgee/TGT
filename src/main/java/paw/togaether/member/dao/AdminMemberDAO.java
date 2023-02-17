package paw.togaether.member.dao;

import org.springframework.stereotype.Repository;
import paw.togaether.common.dao.AbstractDAO;

import java.util.List;
import java.util.Map;

@Repository("adminMemberDAO")
public class AdminMemberDAO extends AbstractDAO {

    public List<Map<String, Object>> getInfoOfMembers(Map<String, Object> map) throws Exception {

        return selectList("getInfoOfMembers", map);
    }

    public Object infoForModify(Map<String, Object> map) throws Exception{

        return selectOne("infoForModify", map);
    }

    public void modifyMemberInfo(Map<String, Object> map) throws Exception {

        update("modifyMemberInfo", map);
    }

    public int getTotalCountMember() {
        return selectOneInt("getTotalCountMember");
    }

    public int getTotalCountDogs() {return selectOneInt("getTotalCountDogs");}
    public void modifyDogname(Map<String, Object> map) {
        update("modifyDogname", map);

    }
    public Object infoForModifyDog(Map<String, Object> map) throws Exception{

        return selectOne("infoForModifyDog", map);
    }
    public void addDogname(Map<String, Object> map) throws Exception{

        insert("addDogname", map);
    }

    public List<Map<String, Object>> listOfDogPaging(Map<String, Object> map) throws Exception{
        return selectList("selectListOfDogPaging", map);
    }
}
