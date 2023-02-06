<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 어드민 페이지의 헤더 -->
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<style>
span.fa-solid {
color:#f0b1aa;
}

.main_wrap thead{
font-weight:bold;
}

#catewrite.btn.submit{
margin-right:5px;
}

</style>
<main class="layoutCenter">

<h1 class="txt_center"><span class="fa-solid fa-paw"></span>함께해요<span class="fa-solid fa-paw"></span></h1>

	<br/>
	<!-- 23.01.25 박선영 : 함께해요 관리자 페이지 게시글 리스트 출력 -->
<div class="main_wrap">
	<table class="txt_center">
		<colgroup>
			<col width="10%"/>
			<col width="7%"/>
			<col width="10%"/>
			<col width="12%"/>
			<col width="10%"/>
			<col width="7%"/>
			<col width="7%"/>
			<col width="13%"/>
			<col width="13%"/>
		</colgroup>
		<thead>
			<tr>
				<th>게시글 번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>모임일자</th>
				<th>마감여부</th>
				<th>작성자</th>
				<th>참여인원</th>
				<th>참여견종</th>
				<th>작성날짜</th>
				<th>수정날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${!empty list }">
					<c:forEach items="${list }" var="adli">
						<tr>
							<td class="txt_center">${adli.TO_IDX}</td>
							<td class="txt_center">${adli.TO_TC_NAME }</td>
							<td class="txt_center">${adli.TO_TITLE}</td>
							<td class="txt_center"><fmt:formatDate value="${adli.TO_DATE }" pattern="yyyy/MM/dd"/></td>
							<td class="txt_center">
								<c:if test="${adli.TO_PEOPLE eq adli.C}">
									모집완료
								</c:if>
								<c:if test="${adli.TO_PEOPLE > adli.C}">
									모집중
								</c:if>
							</td>
							<td class="txt_center">${adli.TO_WRITER_ID }</td>
							<td class="txt_center">${adli.C}</td>
							<td class="txt_center">${adli.BR_NAME}</td>
							<td class="txt_center"><fmt:formatDate value="${adli.TO_REG_DATE }" pattern="yyyy/MM/dd"/></td>
							<td class="txt_center"><fmt:formatDate value="${adli.TO_MOD_DATE }" pattern="yyyy/MM/dd"/></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="9" align="center">조회된 리스트가 없습니다:(</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<br/>
	<div class="flexCenter">
		<a class="btn submit" id="catewrite" href="/admin/together/catewriteForm">카테고리 등록:)</a>
		<a class="btn" id="wtwrite" href="/admin/together/weightwriteForm">몸무게 등록:)</a>
	</div>
</div>	
</main>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>