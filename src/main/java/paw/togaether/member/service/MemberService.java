package paw.togaether.member.service;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.Map;

public interface MemberService {
    /** 마이페이지-나의정보 */
    Map<String, Object> myInfo(Map<String, Object> map, HttpSession session) throws Exception;

    /** 회원정보 수정페이지 */
    Map<String, Object> infoForModify(Map<String, Object> map, HttpSession session) throws Exception;

    /** 사진변경 */
    void changePhoto(Map<String, Object> map, HttpSession session, MultipartFile[] uploadFile) throws Exception;

    /** 사진삭제 */
    void deletePhoto(Map<String, Object> map) throws Exception;

    /** 회원정보 수정 */
    void modifyMyInfo(Map<String,Object> map, HttpSession session) throws Exception;

    /** 회원탈퇴 */
    void deleteMyInfo(Map<String, Object> map, HttpSession session) throws Exception;
}
