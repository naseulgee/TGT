package paw.togaether.common.photo.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import paw.togaether.common.dao.AbstractDAO;

@Repository("photoDAO")
public class PhotoDAO extends AbstractDAO{
	
	//사진등록 쿼리
	public void insertPhoto(Map<String, Object> map) throws Exception {
		 insert("photo.insertPhoto", map);
	}
	
	public void updatePhoto(Map<String, Object> map) throws Exception{
		update("photo.updatePhoto", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMyPhoto(Map<String, Object> map) throws Exception {
		 return (List<Map<String, Object>>)selectList("photo.selectMyPhoto", map);
	}
	
	public void deletePhoto(Map<String, Object> map) throws Exception{
		update("photo.deletePhoto", map);
	}

}
