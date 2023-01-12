package paw.togaether.member.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

@Repository("joinDAO")
public class JoinDAO extends AbstractDAO {

	public void insertMember(Map<String, Object> map) throws Exception {
		insert("join.insertMember", map);		
	}
	
	@SuppressWarnings("unchecked")
	public Object selectMemberID(Map<String, Object> map) {
		return (Map<String,Object>)selectOne("join.selecMemberID",map);
	}
	

	public Object selectMemberEmail(Map<String, Object> map) {
		 return (String)selectOne("join.selectMemberEmail",map);
	}
	

}
