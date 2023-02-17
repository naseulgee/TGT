package paw.togaether.member.service;

import java.util.List;
import java.util.Map;

public interface AdminMemberService {
    List<Map<String, Object>> getInfoOfMembers(Map<String, Object> commandMap) throws Exception;

    Map<String, Object> infoForModify(Map<String, Object> map) throws Exception;

    void modifyMemberInfo(Map<String, Object> map) throws Exception;

    int getTotalItems() throws Exception;

    void modifyDogname(Map<String, Object> commandMap) throws Exception;

    Map<String, Object> infoForModifyDog(Map<String, Object> map) throws Exception;

    void addDogname(Map<String, Object> map) throws Exception;

    List<Map<String, Object>> listOfDogPaging(Map<String, Object> map) throws Exception;

    int getTotalDogItems() throws Exception;
}
