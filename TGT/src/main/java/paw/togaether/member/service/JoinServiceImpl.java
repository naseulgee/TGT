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

/* 회원가입시 아이디,이메일이 중복되는지 확인  */
	@Override
	public String joinMember(Map<String, Object> map) throws Exception {
		 if(!(joinDAO.selectMemberID(map)==null)) {		//중복된 아이디가 있다면 
		        return "아이디";		//"아이디"라는 String으로 리턴
		    }else if(!(joinDAO.selectMemberEmail(map)==null)) {		//중복된 이메일이 있다면
		        return "이메일";		//"이메일"이라는 String으로 리턴
		    }else {			//아이디, 이메일이 중복되지 않는다면 새로운 회원정보를 DB에 insert한다.
		    	joinDAO.insertBreed(map);
		        joinDAO.insertMembers(map);
		        return "완료"; 
		    }
	}

}
