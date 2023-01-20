<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<%@ include file="/WEB-INF/include/user-header.jspf" %>
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<style>
.fa-solid {
color:#f0b1aa;
}

table{
width:800px;
font-size: 22px;
margin-right:auto;
margin-left:auto;
position:relative;
}

tr{
text-align:center;
}
.mypage{
top:100px;
}

.with li{
line-height:2em;
font-size:22px;
}

.main_detail{
float:right;
padding-right:100px;
}
</style>
<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<%@ include file="/WEB-INF/include/nav_mypage.jspf"%>

	<h1 class="txt_center"><span class="fa-solid fa-paw"></span>함께해요<span class="fa-solid fa-paw"></span></h1>
	<br/>
	<!-- 23.01.18 박선영 게시글 상세보기 구현 -->
	<div class="main_detail">
		<table>
			<tbody>
				<tr>
					<td class="bgColor" style="font-size:20px;"><span class="fa-solid fa-paw" style="color:white;"></span> ${map.TO_TC_NAME} <span class="fa-solid fa-paw" style="color:white;"></span></td>
				</tr>
				<tr>
					<td><strong>${map.TO_TITLE}</strong></td>
				</tr>
				<tr>
					<td><strong>${map.TO_BR_NAME}</strong>(이)랑!</td>
				</tr>
				<tr>
					<td>${map.TO_DATE}|${map.TO_TIME}</td>
				</tr>
				<tr>
					<td>${map.TO_LOC}</td>
				</tr>
				<tr>
					<td>${map.TO_CONTENTS}</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<br/>
		<div class="flexCenter">
				<ul class="with">
				<li><span class="fa-solid fa-paw"></span> 참여중이개!  ${map.TO_JOIN_PEOPLE }/${map.TO_PEOPLE }</li>
				<li><span class="fa-solid fa-paw"></span> 대장이개!  ${map.TO_WRITER_ID}</li>
				<c:choose>
						<c:when test="${!empty map.TW_MEM_ID }">
							<li><span class="fa-solid fa-paw"></span> 누구랑 가개?
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
</div>
</main>
<c:if test="${page != 'admin'}">
	<!-- 풋터. 모든 페이지에 삽입! -->
	<%@ include file="/WEB-INF/include/common-footer.jspf" %>
</c:if>