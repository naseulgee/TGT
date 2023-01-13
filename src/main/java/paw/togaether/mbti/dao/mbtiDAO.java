package paw.togaether.mbti.dao;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

@Repository("mbtiDAO")
public class mbtiDAO extends AbstractDAO {

	public void mbti_modify(Map<String, Object> map) throws Exception {
		update("mbti.mbti_modify", map);
	}
}
