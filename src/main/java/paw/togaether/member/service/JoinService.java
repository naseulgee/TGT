package paw.togaether.member.service;

import java.util.List;
import java.util.Map;

public interface JoinService {
	
	void joinMember(Map<String, Object> map) throws Exception;

	int idCheck(String id) throws Exception;

	List<Map<String, Object>> listOfDog(Map<String, Object> map) throws Exception;
}
