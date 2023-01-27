package paw.togaether.common.photo.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

@Repository("photoDAO")
public class PhotoDAO extends AbstractDAO{
	
	//사진등록 쿼리
	public void insertPhoto(Map<String, Object> map) throws Exception {
		 insert("photo.insertPhoto", map);
	}

}
