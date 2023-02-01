package paw.togaether.member.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.log4j.Logger;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import paw.togaether.member.dao.LoginDAO;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;
@Service("loginService")
public class LoginServiceImpl implements LoginService {
    Logger log = Logger.getLogger(this.getClass());

    @Resource(name="loginDAO")
    private LoginDAO loginDAO;
    @Override
    public Map<String, Object> Login(Map<String, Object> map) throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> userdata = (Map<String, Object>) loginDAO.login(map);

        // DB에 해당 유저가 존재한다면
        if(userdata != null){
            // DB에 있는 비밀번호와 입력한 비밀번호와 비교
            Map<String, Object> dbPassword = objectMapper.convertValue(loginDAO.login(map), Map.class);
            String formPassword = (String) map.get("MEM_PW");
            String dbPasswordString = (String)dbPassword.get("MEM_PW");

            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            boolean isloginsuccess = encoder.matches(formPassword, dbPasswordString);
            userdata.put("isloginsuccess", isloginsuccess );
            return userdata;
        } else {
            Map<String, Object> loginerror = new HashMap<>();
            loginerror.put("isloginsuccess", false);
            return loginerror;
        }



    }

    @Override
    public Map<String, Object> findID(Map<String, Object> map) throws Exception {
        String formcallnumber = (String)map.get("MEM_CALL");
        String formnameofdog = (String)map.get("MEM_DOG_NAME");

        Map<String, Object> thingsToFindID = (Map<String, Object>)loginDAO.findID(map);
        if(thingsToFindID == null){
            Map<String, Object> newmap = new HashMap<>();
            newmap.put("dataExists", false);
            return newmap;
        } else {
            String DBcallnumber = (String)thingsToFindID.get("MEM_CALL");
            String DBnameofdog = (String)thingsToFindID.get("MEM_DOG_NAME");

            if(formcallnumber.equals(DBcallnumber) && formnameofdog.equals(DBnameofdog)) {
                thingsToFindID.put("dataExists", true);
            } else {
                thingsToFindID.put("dataExists", false);
            }
            return thingsToFindID;
        }

    }
}
