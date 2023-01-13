package paw.togaether.member.service;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import paw.togaether.member.dao.JoinDAO;

@Service("joinService")
public class JoinServiceImpl implements JoinService {
	Logger log = Logger.getLogger(this.getClass());
		
	@Resource(name="joinDAO")
	private JoinDAO joinDAO;

	@Override
	public void joinMember(Map<String, Object> map) throws Exception {
		
		joinDAO.insertBreed(map);
		joinDAO.insertMembers(map);
		
	}




}
