<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">

		<%@ include file="/WEB-INF/include/nav_mypage.jspf" %>
		<div class="main_wrap">

	<c:forEach items="${reservList}" var="i" varStatus="status">
	
		<!-- 컨텐츠 출력 -->
	
	</c:forEach>


	


	
		</div>
</main><!-- //main 종료 -->

<!-- 풋터. 모든 페이지에 삽입! -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>