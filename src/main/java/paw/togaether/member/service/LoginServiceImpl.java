package paw.togaether.member.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.log4j.Logger;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import paw.togaether.member.dao.LoginDAO;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
    Logger log = Logger.getLogger(this.getClass());

//    @Autowired
//    private JavaMailSender mailSender;
    @Resource(name = "loginDAO")
    private LoginDAO loginDAO;

    @Override
    public Map<String, Object> Login(Map<String, Object> map) throws Exception {
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Object> userdata = (Map<String, Object>) loginDAO.login(map);

        // DB에 해당 유저가 존재한다면
        if (userdata != null) {
            // DB에 있는 비밀번호와 입력한 비밀번호와 비교
            Map<String, Object> dbPassword = objectMapper.convertValue(loginDAO.login(map), Map.class);
            String formPassword = (String) map.get("MEM_PW");
            String dbPasswordString = (String) dbPassword.get("MEM_PW");

            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            boolean isloginsuccess = encoder.matches(formPassword, dbPasswordString);
            userdata.put("isloginsuccess", isloginsuccess);
            return userdata;
        } else {
            Map<String, Object> loginerror = new HashMap<>();
            loginerror.put("isloginsuccess", false);
            return loginerror;
        }


    }

    @Override
    public Map<String, Object> findID(Map<String, Object> map) throws Exception {
        String formEmail = (String) map.get("MEM_EMAIL");

        Map<String, Object> thingsToFindID = (Map<String, Object>) loginDAO.findID(map);
        if (thingsToFindID == null) {
            Map<String, Object> newmap = new HashMap<>();
            newmap.put("dataExists", false);
            return newmap;
        } else {
            String DBEmail = (String) thingsToFindID.get("MEM_EMAIL");

            if (formEmail.equals(DBEmail)) {
                thingsToFindID.put("dataExists", true);
            } else {
                thingsToFindID.put("dataExists", false);
            }
            return thingsToFindID;
        }

    }

    @Override
    public Map<String, Object> selectMemberInfo(Map<String, Object> map, HttpSession session) throws Exception {
        return null;
    }
//
//    @Override
//    public Map<String, Object> selectMemberInfo(Map<String, Object> map, HttpSession session) throws Exception {
//        String formID = (String)map.get("MEM_ID");
//        String formEmail = (String)map.get("MEM_EMAIL");
//
//        Map<String, Object> memberInfo = loginDAO.selectMemberInfo(map);
//        if(memberInfo != null) {
//            Random r = new Random();
//            int num = r.nextInt(999999); // 랜덤난수설정
//
//            String dbID = (String)memberInfo.get("MEM_ID");
//            String dbEmail = (String)memberInfo.get("MEM_EMAIL");
//
//            if(formID.equals(dbID) && formEmail.equals(dbEmail)) {
//                session.setAttribute("email", dbEmail);
//
//                String setfrom = "togaether33@gmail.com";
//                String tomail = dbEmail; //받는사람
//                String title = "[투개더] 비밀번호변경 인증 이메일 입니다";
//                String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
//                        + "투개더 비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); //
//
////                try {
////                    MimeMessage message = mailSender.createMimeMessage();
////                    MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
////
////                    messageHelper.setFrom(setfrom);
////                    messageHelper.setTo(tomail);
////                    messageHelper.setSubject(title);
////                    messageHelper.setText(content);
//
////                    mailSender.send(message);
////                } catch (Exception e) {
////                    System.out.println(e.getMessage());
////                }
////                memberInfo.put("dataExists", true);
////                memberInfo.put("num", num);
////                return memberInfo;
////
////            } else {
////                memberInfo.put("dataExists", false);
////                return memberInfo;
////                }
////
////            } else {
////                memberInfo.put("dataExists", false);
////                return memberInfo;
////        }
//    }
//
//
//    }
}




