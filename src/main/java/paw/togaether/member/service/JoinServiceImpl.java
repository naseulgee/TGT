package paw.togaether.member.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import paw.togaether.member.dao.JoinDAO;

@Service("joinService")
public class JoinServiceImpl implements JoinService {
	Logger log = Logger.getLogger(this.getClass());
		
	@Resource(name="joinDAO")
	private JoinDAO joinDAO;

	@Override
	public void joinMember(Map<String, Object> map) throws Exception {
		/*String originPassword = (String)map.get("MEM_PW");
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePassword = encoder.encode(originPassword);
		map.put("MEM_PW", securePassword);*/

		String address = (String)map.get("address");



		joinDAO.insertMembers(map);
		
	}




}
