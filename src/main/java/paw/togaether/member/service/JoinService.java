package paw.togaether.member.service;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface JoinService {
	
	void joinMember(Map<String, Object> map, HttpSession session, MultipartFile[] uploadFile) throws Exception;

	int idCheck(String id) throws Exception;

	List<Map<String, Object>> listOfDog(Map<String, Object> map) throws Exception;

	int emailCheck(String email) throws Exception;
}
