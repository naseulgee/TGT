<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 어드민 페이지의 헤더 -->
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<style>
.fa-solid {
color:#f0b1aa;
}
</style>

<main class="layoutCenter">

<h1 class="txt_center"><span class="fa-solid fa-paw"></span>함께해요<span class="fa-solid fa-paw"></span></h1>
	<br/>
<div class="main_wrap">
	<table class="txt_center">
		<colgroup>
			
		</colgroup>
		<thead>
			<tr>
				<th>함께해요 분류 번호</th>
				<th>함께해요 분류 이름</th>
				<th>함께해요 분류 게시글 수</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${!empty catelist}">
					<c:forEach items="${catelist}" var="adct">
						<tr>
							<td>${adct.TC_IDX}</td>
							<td>${adct.TC_NAME }</td>
							<td>${adct.TC_COUNT }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td class="empty paw_hover" colspan="3" align="center">카테고리가 없습니다:(</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
</div>
<br/>
<div class="flexCenter">
	<a class="btn submit" href="/admin/together/catewriteForm.paw">함께해요 분류등록하기</a>
</div>
</main>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>