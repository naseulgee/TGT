package paw.togaether.common.resolver;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import paw.togaether.common.domain.CommandMap;

public class CustomMapArgumentResolver implements HandlerMethodArgumentResolver{
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		return CommandMap.class.isAssignableFrom(parameter.getParameterType());
	}
	
	//전송 파라미터를 맵에 담도록 조작하는 메소드
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		CommandMap commandMap = new CommandMap();//컨트롤러에서 사용 가능하도록 커스텀 Map 객체 생성
		//키와 값을 저장할 변수 선언
		String key = null;
		String[] values = null;//값은 여러개가 전달될 수 있다.(체크박스 고려)
		
		//전송받은 데이터 세팅
		HttpServletRequest request = (HttpServletRequest)webRequest.getNativeRequest();
		Enumeration<?> enumeration = request.getParameterNames();//파라미터 이름들 추출
		while(enumeration.hasMoreElements()) {//파라미터명 만큼 반복
			//키와 값 세팅
			key = (String)enumeration.nextElement();
			values = request.getParameterValues(key);
			if(values != null) {//만약 저장된 값이 있다면
				//커스텀 Map 클래스에 키와 값 저장.
				//값이 1개 이상일 경우 배열 그대로 저장
				commandMap.put(key, (values.length > 1)?values:values[0]);
			}
		}
		return commandMap;//모델로 맵 리턴
	}
}