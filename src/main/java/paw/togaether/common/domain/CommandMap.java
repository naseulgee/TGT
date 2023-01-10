package paw.togaether.common.domain;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

//request 영역의 파라미터를 맵에 담게할 클래스.
public class CommandMap {
	//Map을 상속받지 않고 필드로 저장한다.
	Map<String, Object> map = new HashMap<String, Object>();
	
	//Map과 동일하게 사용할 수 있도록, Map의 메소드를 만들어준다.
	public Map<String, Object> getMap() { return map; }
	public Object get(String key) { return map.get(key); }
	public void put(String key, Object value) { map.put(key, value); }
	public void putAll(Map<? extends String, ? extends Object> m) { map.putAll(m); }
	public Object remove(String key) { return map.remove(key); }
	public boolean containsKey(String key) { return map.containsKey(key); }
	public boolean containsValue(Object value) { return map.containsValue(value); }
	public void clear() { map.clear(); }
	public Set<Entry<String, Object>> entrySet() { return map.entrySet(); }
	public Set<String> keySet() { return map.keySet(); }
	public boolean isEmpty() { return map.isEmpty(); }
}