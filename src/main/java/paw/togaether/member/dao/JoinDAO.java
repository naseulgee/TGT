package paw.togaether.member.dao;

import org.springframework.stereotype.Repository;
import paw.togaether.common.dao.AbstractDAO;

import java.util.List;
import java.util.Map;

@Repository("joinDAO")
public class JoinDAO extends AbstractDAO {

	/** 회원가입 */
	public void insertMembers(Map<String, Object> map) throws Exception {
		insert("join.insertMembers", map);	
	}

	/** 회원가입시 id중복체크 */
	public int checkId(String id) throws Exception {
		int result = selectOneInt("join.findId", id);
		return result;
	}

	/** 셀렉트박스에 견종명 불러오기 */
	public List<Map<String, Object>> listOfDog(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>)selectList("join.selectListOfDog", map);
	}

	/** 회원가입시 이메일주소 중복체크 */
	public int checkEmail(String email) throws Exception{
		int result = selectOneInt("join.findEmail", email);
		return result;
	}
}
