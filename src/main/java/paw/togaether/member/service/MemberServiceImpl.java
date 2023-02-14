package paw.togaether.member.service;

import org.apache.log4j.Logger;
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

    @Override
    public void changePhoto(Map<String, Object> map, HttpSession session, MultipartFile[] uploadFile) throws Exception {

        photoDAO.deletePhoto(map);

        List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, session, uploadFile);
        for(int i=0, size=list.size(); i<size; i++) {
            photoDAO.insertPhoto(list.get(i));
        }
    }

    @Override
    public void deletePhoto(Map<String, Object> map) throws Exception {

        photoDAO.deletePhoto(map);
    }
}
