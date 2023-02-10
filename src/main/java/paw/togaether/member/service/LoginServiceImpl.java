package paw.togaether.member.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import paw.togaether.member.dao.LoginDAO;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
    Logger log = Logger.getLogger(this.getClass());

    @Autowired
    private JavaMailSender mailSender;
    @Resource(name = "loginDAO")
    private LoginDAO loginDAO;

    @Value("${kakao.key}")
    private String kakaoKey;

    /** 로그인 */
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

    /** 아이디 찾기 */
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

    /** 비밀번호찾기시 가입한 이메일주소로 인증번호 전송 */
    @Override
    public Map<String, Object> selectMemberInfo(Map<String, Object> map, HttpSession session) throws Exception {
        String formID = (String)map.get("MEM_ID");
        String formEmail = (String)map.get("MEM_EMAIL");

        Map<String, Object> memberInfo = loginDAO.selectMemberInfo(map);
        if(memberInfo != null) {
            Random r = new Random();
            int num = r.nextInt(999999); // 랜덤난수설정

            String dbID = (String)memberInfo.get("MEM_ID");
            String dbEmail = (String)memberInfo.get("MEM_EMAIL");

            if(formID.equals(dbID) && formEmail.equals(dbEmail)) {
                session.setAttribute("email", dbEmail);

                String setfrom = "togaether33@gmail.com";
                String tomail = dbEmail; //받는사람
                String title = "[투개더] 비밀번호변경 인증 이메일 입니다";
                String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
                        + "투개더 비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); //

                try {
                    MimeMessage message = mailSender.createMimeMessage();
                    MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");

                    messageHelper.setFrom(setfrom);
                    messageHelper.setTo(tomail);
                    messageHelper.setSubject(title);
                    messageHelper.setText(content);

                    mailSender.send(message);
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
                memberInfo.put("dataExists", true);
                memberInfo.put("num", num);
                return memberInfo;

            } else {
                memberInfo.put("dataExists", false);
                return memberInfo;
                }

            } else {
                Map<String, Object> newmap = new HashMap<>();
                newmap.put("dataExists", false);
                return newmap;
        }
    }

    /** 비밀번호찾기 인증번호 검증 */
    @Override
    public Map<String, Object> isNumCorrect(Map<String, Object> map, HttpSession session) throws Exception {
        String inputFormAuthNum = (String)map.get("authNum");
        String sessionAuthNum = session.getAttribute("num").toString();

        Map<String, Object> newmap = new HashMap<>();

        if(inputFormAuthNum.equals(sessionAuthNum)) {
            newmap.put("isNumCorrect", true);
        } else {
            newmap.put("isNumCorrect", false);
        }
        return newmap;
    }

    /** 인증번호 검증 후 새 비밀번호 설정 */
    @Override
    public void setNewPassword(Map<String, Object> map, HttpSession session) throws Exception {

        String originPassword = (String)map.get("MEM_PW");
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String securePassword = encoder.encode(originPassword);
        map.put("MEM_PW", securePassword);

        String sessionEmail = (String)session.getAttribute("email");
        map.put("MEM_EMAIL", sessionEmail);

        loginDAO.setNewPassword(map);
    }

    @Override
    public String getAccessToken(String code) throws Exception {
        URL url = new URL("https://kauth.kakao.com/oauth/token");

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
        conn.setDoOutput(true);

        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
        String body = "grant_type=authorization_code" + "&client_id="+ kakaoKey + "&redirect_uri=http://localhost:8000/member/socialLogin" + "&code="+code;
        bw.write(body);
        bw.flush();

        int responseCode = conn.getResponseCode();
        System.out.println(responseCode);


        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String line = "";
        String result = "";

        while ((line = br.readLine()) != null) {
            result += line;
        }
        System.out.println("response body : " + result);

        JsonParser parser = new JsonParser();   //json 파싱 객체생성
        JsonElement element = parser.parse(result);  //json 파싱

        String access_token = element.getAsJsonObject().get("access_token").getAsString(); //access_token을 가져와서 String으로 변환

        br.close();
        bw.close();

        return access_token;
    }

    @Override
    public Map<String, Object> getUserInfo(String access_token) throws Exception {
        URL url = new URL("https://kapi.kakao.com/v2/user/me");
        HttpURLConnection conn = (HttpURLConnection)url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
        conn.setRequestProperty("Authorization", "Bearer " + access_token);
        conn.setDoOutput(true);

        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String line = "";
        String result = "";

        while((line = br.readLine()) != null) {
            result += line;
        }
        System.out.println("response body : " + result);
        JsonParser parser = new JsonParser();
        JsonElement element = parser.parse(result);

       String email =  element.getAsJsonObject()
               .get("kakao_account")
               .getAsJsonObject()
               .get("email")
               .getAsString();

        br.close();

        Map<String,Object> map = new HashMap<>();
        map.put("MEM_EMAIL", email);

        return map;
    }

    @Override
    public Map<String, Object> findEmail(Map<String, Object> map) throws Exception {

        Map<String,Object> findEmail = (Map<String, Object>) loginDAO.findEmail(map);

        return findEmail;
    }


    @Override
    public void socialLogout(String accessToken) throws Exception {
        URL url = new URL("https://kapi.kakao.com/v1/user/logout");
        HttpURLConnection conn = (HttpURLConnection)url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "Bearer " + accessToken);
        conn.setDoOutput(true);
        int responseCode = conn.getResponseCode();
        System.out.println(responseCode);

    }

}





