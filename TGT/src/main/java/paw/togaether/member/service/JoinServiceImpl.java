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
	public String joinMember(Map<String, Object> map) throws Exception {
		 if(!(joinDAO.selectMemberID(map)==null)) {
		        return "아이디";
		    }else if(!(joinDAO.selectMemberEmail(map)==null)) {
		        return "이메일";
		    }else {
		        joinDAO.insertMember(map);
		        return "완료"; 
		    }
	}

}
