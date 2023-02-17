package paw.togaether.member.service;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import paw.togaether.member.dao.AdminMemberDAO;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service("adminMemberService")
public class AdminMemberServiceImpl implements AdminMemberService {

    Logger log = Logger.getLogger(this.getClass());

    @Resource(name="adminMemberDAO")
    private AdminMemberDAO adminMemberDAO;

    @Override
    public List<Map<String, Object>> getInfoOfMembers(Map<String, Object> commandMap) throws Exception {

        List<Map<String,Object>> memberlist = adminMemberDAO.getInfoOfMembers(commandMap);

        return memberlist;
    }

    @Override
    public Map<String, Object> infoForModify(Map<String, Object> map) throws Exception {

        Map<String,Object> infoForModify = (Map<String, Object>) adminMemberDAO.infoForModify(map);

        return infoForModify;
    }

    @Override
    public void modifyMemberInfo(Map<String, Object> map) throws Exception {

        String address = (String)map.get("address");
        String detailAddress = (String)map.get("detailAddress");
        String MEM_ADDR = String.format("%5s%5s", address, detailAddress);
        map.put("MEM_ADDR", MEM_ADDR);

        adminMemberDAO.modifyMemberInfo(map);

    }

    @Override
    public int getTotalItems() throws Exception {
        int result = adminMemberDAO.getTotalCountMember();
        return result;
    }

    @Override
    public void modifyDogname(Map<String, Object> map) throws Exception {
        adminMemberDAO.modifyDogname(map);
    }

    @Override
    public Map<String, Object> infoForModifyDog(Map<String, Object> map) throws Exception {
        Map<String,Object> infoForModifyDog = (Map<String, Object>) adminMemberDAO.infoForModifyDog(map);

        return infoForModifyDog;
    }

    @Override
    public void addDogname(Map<String, Object> map) throws Exception {
        adminMemberDAO.addDogname(map);
    }

    @Override
    public List<Map<String, Object>> listOfDogPaging(Map<String, Object> map) throws Exception {
        return adminMemberDAO.listOfDogPaging(map);
    }

    @Override
    public int getTotalDogItems() throws Exception {
        int result = adminMemberDAO.getTotalCountDogs();
        return result;
    }

}
