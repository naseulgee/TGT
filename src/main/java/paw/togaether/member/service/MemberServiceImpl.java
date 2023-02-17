package paw.togaether.member.service;

import org.apache.log4j.Logger;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import paw.togaether.common.photo.dao.PhotoDAO;
import paw.togaether.common.util.FileUtils;
import paw.togaether.member.dao.MemberDAO;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
    Logger log = Logger.getLogger(this.getClass());

    @Resource(name="fileUtils") //파일 저장에 대한 메서드를 가진 클래스
    private FileUtils fileUtils;

    @Resource(name="photoDAO")
    private PhotoDAO photoDAO; //파일 DB등록에 대한 메서드를 가진 클래스

    @Resource(name = "memberDAO")
    private MemberDAO memberDAO;

    /** 회원정보 출력페이지 */
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

    /** 회원정보 수정페이지 */
    @Override
    public Map<String, Object> infoForModify(Map<String, Object> map, HttpSession session) throws Exception {
        String MEM_ID = (String)session.getAttribute("mem_id");
        map.put("MEM_ID", MEM_ID);

        Map<String,Object> infoOfUser = (Map<String, Object>) memberDAO.selectMyInfo(map);
        String address = (String)infoOfUser.get("MEM_ADDR");


        String kindOfDog = (String)infoOfUser.get("BR_NAME");

        return infoOfUser;
    }

    /** 사진 변경 */
    @Override
    public void changePhoto(Map<String, Object> map, HttpSession session, MultipartFile[] uploadFile) throws Exception {

        photoDAO.deletePhoto(map);

        List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, session, uploadFile);
        for(int i=0, size=list.size(); i<size; i++) {
            photoDAO.insertPhoto(list.get(i));
        }
    }

    /** 사진 삭제 */
    @Override
    public void deletePhoto(Map<String, Object> map) throws Exception {

        photoDAO.deletePhoto(map);
    }

    /** 회원정보 수정 */
    @Override
    public void modifyMyInfo(Map<String,Object> map, HttpSession session) throws Exception {

        //비밀번호 암호화
        String originPassword = (String)map.get("MEM_PW");
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String securePassword = encoder.encode(originPassword);
        map.put("MEM_PW", securePassword);
        //주소와 상세주소 합쳐서 db에 저장
        String address = (String)map.get("address");
        String detailAddress = (String)map.get("detailAddress");
        String MEM_ADDR = String.format("%5s%5s", address, detailAddress);
        map.put("MEM_ADDR", MEM_ADDR);

        String MEM_ID = (String)session.getAttribute("mem_id");
        map.put("MEM_ID", MEM_ID);

        memberDAO.modifyMyInfo(map, session);
    }

    /** 회원탈퇴 */
    @Override
    public void deleteMyInfo(Map<String, Object> map, HttpSession session) throws Exception {
        String MEM_ID = (String)session.getAttribute("mem_id");
        map.put("MEM_ID", MEM_ID);

        memberDAO.deleteMyInfo(map,session);

    }
}
