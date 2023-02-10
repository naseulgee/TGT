<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 어드민 페이지의 헤더 -->
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<style>
span.fa-solid {
color:#f0b1aa;
}

#wtreg.btn.submit{
margin-right:5px;
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
				<th>몸무게 번호</th>
				<th>몸무게 시작 범위</th>
				<th>몸무게 종료 범위</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${!empty wtlist}">
					<c:forEach items="${wtlist}" var="wt">
						<tr>
							<td>${wt.WT_IDX}</td>
							<td>${wt.WT_START} Kg</td>
							<td>${wt.WT_END} Kg</td>
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
	<a class="btn submit" id="wtreg" href="/admin/together/weightwriteForm">몸무게 등록하기</a>
	<a class="btn" href="/admin/together/list">게시글 목록으로</a>
</div>
</main>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>