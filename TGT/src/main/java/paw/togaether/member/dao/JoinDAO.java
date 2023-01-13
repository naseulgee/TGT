package paw.togaether.member.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

@Repository("joinDAO")
public class JoinDAO extends AbstractDAO {
	
	public void insertBreed(Map<String, Object> map) {
		insert("join.insertBreed", map);		
		
	}

	public void insertMembers(Map<String, Object> map) throws Exception {
		insert("join.insertMembers", map);		
	}
	
	@SuppressWarnings("unchecked")
	public Object selectMemberID(Map<String, Object> map) {
		return (Map<String,Object>)selectOne("join.selecMemberID",map);	//리턴값이 Map인 이유는 로그인 구현시에 유저에 대한 정보를 가져와 세션에 저장하기 위함
	}
	

	public Object selectMemberEmail(Map<String, Object> map) {
		 return (String)selectOne("join.selectMemberEmail",map);
	}

	
	

}
