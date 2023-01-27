package paw.togaether.member.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.log4j.Logger;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import paw.togaether.member.dao.LoginDAO;

import javax.annotation.Resource;
import java.util.Map;
@Service("loginService")
public class LoginServiceImpl implements LoginService {
    Logger log = Logger.getLogger(this.getClass());

    @Resource(name="loginDAO")
    private LoginDAO loginDAO;
    @Override
    public boolean Login(Map<String, Object> map) throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();

        if(loginDAO.login(map) == null){
            return false;
        }
        Map<String, Object> dbPassword = objectMapper.convertValue(loginDAO.login(map), Map.class);
        String formPassword = (String) map.get("MEM_PW");
        String dbPasswordString = (String)dbPassword.get("MEM_PW");

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.matches(formPassword, dbPasswordString);

    }
}
