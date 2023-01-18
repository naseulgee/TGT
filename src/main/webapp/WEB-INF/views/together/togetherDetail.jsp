<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<c:if test="${page != 'admin'}">
	<!-- 어드민 제외한 모든 페이지의 헤더 -->
	<%@ include file="/WEB-INF/include/user-header.jspf" %>
</c:if>
<c:if test="${page == 'admin'}">
	<!-- 어드민 페이지의 헤더 -->
	<%@ include file="/WEB-INF/include/admin-header.jspf" %>
</c:if>
<style>
.fa-solid {
color:#f0b1aa;
}

table{
width:100%;
}
</style>
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">

	<h1 class="txt_center"><span class="fa-solid fa-paw"></span>함께해요<span class="fa-solid fa-paw"></span></h1>
	<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>
	
	<!-- 23.01.18 박선영 게시글 상세보기 구현 -->
	<div class="main_detail">
		<table class="flexCenter">
			<tbody>
				<tr>
					<td>${map.TO_TC_NAME}</td>
				</tr>
				<tr>
					<td>${map.TO_TITLE}</td>
				</tr>
				<tr>
					<td>참여하개: ${map.TO_BR_NAME}</td>
				</tr>
				<tr>
					<td>언제개 : ${map.TO_DATE}|${map.TO_TIME}</td>
				</tr>
				<tr>
					<td>어디개 : ${map.TO_LOC}</td>
				</tr>
				<tr>
					<td>${map.TO_CONTENTS}</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<br/>
		<div class="flexCenter">
				<ul>
				<li>참여중이개! ${map.TO_JOIN_PEOPLE }/${map.TO_PEOPLE }</li>
				<li>대장이개! ${map.TO_WRITER_ID}</li>
				<c:choose>
						<c:when test="${!empty map.TW_MEM_ID }">
							<li>
								<c:forEach items="${map.TW_MEM_ID }">
									${map.TW_MEM_ID }
								</c:forEach>
							</li>
						</c:when>
						<c:otherwise>
							<li>
							참여자가 없습니다:(
							</li>
						</c:otherwise>
					</c:choose>
				</ul>
		</div>
	</div>
	
</main>
<c:if test="${page != 'admin'}">
	<!-- 풋터. 모든 페이지에 삽입! -->
	<%@ include file="/WEB-INF/include/common-footer.jspf" %>
</c:if>