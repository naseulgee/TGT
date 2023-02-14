package paw.togaether.member.service;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.Map;

public interface MemberService {
    Map<String, Object> myInfo(Map<String, Object> map, HttpSession session) throws Exception;

    Map<String, Object> infoForModify(Map<String, Object> map, HttpSession session) throws Exception;

    void changePhoto(Map<String, Object> map, HttpSession session, MultipartFile[] uploadFile) throws Exception;

    void deletePhoto(Map<String, Object> map) throws Exception;
}
