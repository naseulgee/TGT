package paw.togaether.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

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
	public Object selectPagingList(String queryId, Object params) {
		//전달받은 Object를 Map 타입으로 변환
		Map<String, Object> map = (Map<String, Object>)params;
		pringQueryId(queryId);//로그 찍기
		 
		//현재 페이지. 값이 없으면 1
		int currentPageNo = StringUtils.isEmpty(map.get("CURRENT_PAGE_NO"))?1:Integer.parseInt(map.get("CURRENT_PAGE_NO").toString());
		//한 페이지당 출력 게시물 개수. 값이 없으면 15
		int page_row = StringUtils.isEmpty(map.get("PAGE_ROW"))?15:Integer.parseInt(map.get("PAGE_ROW").toString());
		
		//페이징 SQL에 사용되는 rownum 값 세팅
		int start = (currentPageNo-1) * page_row;//시작 게시물 번호
		int end = start + page_row;//종료 게시물 번호
		map.put("START", start+1);
		map.put("END", end);
		
		return sqlSession.selectList(queryId, map);
	}
}