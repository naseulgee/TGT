package paw.togaether.member.service;

import org.apache.log4j.Logger;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import paw.togaether.common.photo.dao.PhotoDAO;
import paw.togaether.common.util.FileUtils;
import paw.togaether.member.dao.JoinDAO;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Service("joinService")
public class JoinServiceImpl implements JoinService {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="fileUtils") //파일 저장에 대한 메서드를 가진 클래스
	private FileUtils fileUtils;

	@Resource(name="photoDAO")
	private PhotoDAO photoDAO; //파일 DB등록에 대한 메서드를 가진 클래스

	@Resource(name="joinDAO")
	private JoinDAO joinDAO;

	/** 회원가입 */
	@Override
	public void joinMember(Map<String, Object> map, HttpSession session, MultipartFile[] uploadFile) throws Exception {
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

		joinDAO.insertMembers(map);

		//회원insert문, 시설insert문 처리후 해당 코드를 추가
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, session, uploadFile);
		for(int i=0, size=list.size(); i<size; i++) {
			photoDAO.insertPhoto(list.get(i));
		}


	}

	/** 회원가입시 id중복체크 */
	@Override
	public int idCheck(String id) throws Exception {
		int result = joinDAO.checkId(id);
		return result;
	}

	/** 셀렉트박스에 견종명 불러오기 */
	@Override
	public List<Map<String, Object>> listOfDog(Map<String, Object> map) throws Exception {
		return joinDAO.listOfDog(map);

	}

	/** 회원가입시 이메일주소 중복체크 */
	@Override
	public int emailCheck(String email) throws Exception {
		int result = joinDAO.checkEmail(email);
		return result;
	}


}
