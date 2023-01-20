package paw.togaether.member.service;

import org.apache.log4j.Logger;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import paw.togaether.member.dao.JoinDAO;

import javax.annotation.Resource;
import java.util.Map;

@Service("joinService")
public class JoinServiceImpl implements JoinService {
	Logger log = Logger.getLogger(this.getClass());
		
	@Resource(name="joinDAO")
	private JoinDAO joinDAO;

	@Override
	public void joinMember(Map<String, Object> map) throws Exception {

		String originPassword = (String)map.get("MEM_PW");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePassword = encoder.encode(originPassword);
		map.put("MEM_PW", securePassword);

		String address = (String)map.get("address");
		String detailAddress = (String)map.get("detailAddress");
		String MEM_ADDR = String.format("%5s%5s", address, detailAddress);
		map.put("MEM_ADDR", MEM_ADDR);




		joinDAO.insertMembers(map);
		
	}

	@Override
	public int idCheck(String id) throws Exception {
		int result = joinDAO.checkId(id);
		return result;
	}


}
