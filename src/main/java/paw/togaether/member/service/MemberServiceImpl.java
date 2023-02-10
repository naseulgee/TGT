package paw.togaether.member.service;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import paw.togaether.member.dao.MemberDAO;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
    Logger log = Logger.getLogger(this.getClass());

    @Resource(name = "memberDAO")
    private MemberDAO memberDAO;

    @Override
    public Map<String, Object> myInfo(Map<String, Object> map, HttpSession session) throws Exception {
        String MEM_ID = (String)session.getAttribute("mem_id");
        map.put("MEM_ID", MEM_ID);

       Map<String,Object> result = (Map<String, Object>) memberDAO.selectMyInfo(map);
       String kindOfDog = (String)result.get("BR_NAME");

       if(kindOfDog.equals("기타")) {
           String br_name = (String)result.get("MEM_BR_NAME");
           result.put("BR_NAME", br_name);
       }

        return result;
    }
}
