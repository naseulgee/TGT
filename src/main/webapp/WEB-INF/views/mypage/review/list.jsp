<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<style>

#phIcon,#stars {
	display: inline-block;
}
</style>


<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<%@ include file="/WEB-INF/include/nav_mypage.jspf" %>
		<div class="main_wrap txt_center">
		
		<h1>나의 리뷰</h1>
		<div class="color">${mem_id}님의 리뷰페이지입니다:)</div><br><br>

	<table>
		<thead>
			<tr>
				<th>시설</th>
				<th colspan="2">제목</th>
				<th>별점</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${reviewList}" var="i" varStatus="status">
			<tr>
				<td>${i.PL_NAME}</td>
				<td colspan="2">
					<a class="use_move" href="/mypage/review/myReview.paw" onclick="move(this, 're_idx:${i.RE_IDX}')">
					<c:choose>
       					 <c:when test="${fn:length(i.RE_CONTENTS) gt 26}">
        					${fn:substring(i.RE_CONTENTS, 0, 25)}...
        				</c:when>
        				<c:otherwise> ${i.RE_CONTENTS} </c:otherwise>
					</c:choose>				
					<c:if test="${i.PHCOUNT>0}">
						<i class="fa-solid fa-image" id="phIcon"></i>
					</c:if>
					</a>
				</td>
				<td>
					<c:forEach var="j" begin="1" end="${i.RE_STAR}">
    					<i class="fa-solid fa-paw color" id="stars"></i>
					</c:forEach>
				</td>
				<td><fmt:formatDate value="${i.RE_REG_DATE}" pattern="yyyy.MM.dd" /></td>	
			</tr>
			</c:forEach>
		</tbody>
	</table>




	


	
		</div>
</main><!-- //main 종료 -->

<!-- 풋터. 모든 페이지에 삽입! -->
<%@ include file="/WEB-INF/include/common-footer.jspf" %>