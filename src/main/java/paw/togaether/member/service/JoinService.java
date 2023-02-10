package paw.togaether.member.service;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface JoinService {

	/** 회원가입 */
	void joinMember(Map<String, Object> map, HttpSession session, MultipartFile[] uploadFile) throws Exception;

	/** 회원가입시 아이디 중복체크 */
	int idCheck(String id) throws Exception;

	/** 셀렉트박스에 견종명 불러오기 */
	List<Map<String, Object>> listOfDog(Map<String, Object> map) throws Exception;

	/** 회원가입시 이메일 중복체크 */
	int emailCheck(String email) throws Exception;
}
