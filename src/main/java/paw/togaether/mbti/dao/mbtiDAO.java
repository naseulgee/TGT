package paw.togaether.mbti.dao;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

@Repository("mbtiDAO")
public class MbtiDAO extends AbstractDAO {

	public void mbtiModify(Map<String, Object> map) throws Exception {
		update("mbti.mbtiModify", map);
	}
}
