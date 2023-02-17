package paw.togaether.common.dao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Map;

public class AbstractDAO {
	protected Log log = LogFactory.getLog(AbstractDAO.class);
	
	@Autowired//컨테이너에서 해당 [타입]의 객체를 찾아 주입
	private SqlSessionTemplate sqlSession;
	
	protected void pringQueryId(String queryId) {//로그용
		if(log.isDebugEnabled()) log.debug("\t QueryId \t "+queryId);
	}
	public Object insert(String queryId, Object params) {//삽입
		pringQueryId(queryId);
		return sqlSession.insert(queryId, params);
	}
	public Object update(String queryId, Object params) {//수정
		pringQueryId(queryId);
		return sqlSession.update(queryId, params);
	}
	public Object delete(String queryId, Object params) {//삭제
		pringQueryId(queryId);
		return sqlSession.delete(queryId, params);
	}
	public Object selectOne(String queryId) {//한줄
		pringQueryId(queryId);
		return sqlSession.selectOne(queryId);
	}
	public Object selectOne(String queryId, Object params) {
		pringQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}
	public int selectOneInt(String queryId, Object params){
		pringQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}
	public int selectOneInt(String queryId){
		pringQueryId(queryId);
		return sqlSession.selectOne(queryId);
	}

	@SuppressWarnings("rawtypes")
	public List selectList(String queryId) {//여러줄
		pringQueryId(queryId);
		return sqlSession.selectList(queryId);
	}

	@SuppressWarnings("rawtypes")
	public List selectList(String queryId, Object params) {
		pringQueryId(queryId);
		return sqlSession.selectList(queryId, params);
	}
	
	@SuppressWarnings("unchecked")
	public Object selectPagingList(String queryId, Object params){
		pringQueryId(queryId);
		Map<String,Object> map = (Map<String,Object>)params;
		
		String strPageIndex = (String)map.get("PAGE_INDEX");
		String strPageRow = (String)map.get("PAGE_ROW");
		int nPageIndex = 0;
		int nPageRow = 10;
		
		if(StringUtils.isEmpty(strPageIndex) == false){
			nPageIndex = Integer.parseInt(strPageIndex)-1;
		}
		if(StringUtils.isEmpty(strPageRow) == false){
			nPageRow = Integer.parseInt(strPageRow);
		}
		map.put("START", (nPageIndex * nPageRow) + 1);
		map.put("END", (nPageIndex * nPageRow) + nPageRow);
		
		return sqlSession.selectList(queryId, map);
	}
}