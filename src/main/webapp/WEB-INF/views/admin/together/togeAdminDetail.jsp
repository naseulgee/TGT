<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 어드민 페이지의 헤더 -->
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<style>
span.fa-solid {
color:#f0b1aa;
}

table.txt_center{
font-size : 16px;
}

input.use_move{
border-color: #ce0000;
background-color : #ce0000;
color : #fff;
padding-top : 5px; 
padding-right :10px;
padding-bottom : 5px;
padding-left : 10px;
margin-left : 5px;
font-size : 16px;
}

button.use_move{
color:#f0b1aa;
padding-top : 5px; 
padding-right :10px;
padding-bottom : 5px;
padding-left : 10px;
}
</style>
<main class="layoutCenter">
<div class="main_wrap">
<h1 class="txt_center"><span class="fa-solid fa-paw"></span>함께해요<span class="fa-solid fa-paw"></span></h1>
<br/>
	<table class="txt_center">
		
		<tbody>
			<tr>
				<th><strong>제목</strong> </th>
				<td><strong> ${map.TO_TITLE}</strong></td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td> ${map.TO_TC_NAME }</td>
			</tr>
			<tr>
				<th>참여가능 견종</th>
				<td> ${map.BR_NAME}</td>
			</tr>
			<tr>
				<th>참여가능 크기</th>
				<td><c:if test="${map.TO_WT_IDX eq '1'}">XS</c:if>
					<c:if test="${map.TO_WT_IDX eq '2'}">S</c:if>
					<c:if test="${map.TO_WT_IDX eq '3'}">M</c:if>
					<c:if test="${map.TO_WT_IDX eq '4'}">L</c:if>
					<c:if test="${map.TO_WT_IDX eq '5'}">XL</c:if>
				</td><!-- 참여가능사이즈 -->
			</tr>
			<tr>
				<th>모임날짜</th>
				<td> ${map.TO_DATE}</td>
			</tr>	
			<tr>
				<th>모임시간</th>
				<td> ${map.TO_TIME}</td>
			</tr>
			<tr>
				<th>모집인원</th>
				<td> ${map.TO_PEOPLE}</td>
			</tr>
			<tr>
				<th>참여멤버</th>
				<td>
				<ul>
					<c:forEach items="${wlist}" var="wl">
						<li>
							<button class="use_move" data-href="/admin/together/withdetail" onclick="move(this, 'TO_IDX:${wl.TW_TO_IDX}', 'TW_MEM_ID:${wl.TW_MEM_ID}')">
							${wl.TW_MEM_ID}</button>
						</li>
					</c:forEach>
				</ul>
				<c:if test="${empty wlist}">참여인원이 없습니다:(</c:if>
				</td>
			</tr>
			<tr>
				<th>등록날짜</th>
				<td> ${map.TO_REG_DATE}</td>
			</tr>
			<tr>
				<th>수정날짜</th>
				<td> ${map.TO_MOD_DATE}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td> ${map.TO_CONTENTS}</td>
			</tr>
			<tr>
				<th>모집여부</th>
				<td>
				<c:if test="${nowDate > map.TO_DATE}">마감</c:if>
				<c:if test="${nowDate eq map.TO_DATE }">
					<c:if test="${nowTime > map.TO_TIME}">
						마감
					</c:if>
					<c:if test="${nowTime <= map.TO_TIME}">
						<c:if test ="${map.TO_PEOPLE eq map.C}">모집완료</c:if>
						<c:if test = "${map.TO_PEOPLE > map.C }">모집중</c:if>
					</c:if>
				</c:if>
				<c:if test="${nowDate < map.TO_DATE}">
					<c:if test ="${map.TO_PEOPLE eq map.C}">모집완료</c:if>
					<c:if test = "${map.TO_PEOPLE > map.C }">모집중</c:if>
				</c:if>
				</td>
			</tr>
		</tbody>
	</table>
	
	<br/>
	<div class="flexCenter">
		<a class="btn submit" href="/admin/together/list">목록으로</a>
		<input type="button" class="use_move" data-href="/admin/together/delete" onclick="move(this, 'TO_IDX:${map.TO_IDX}')" value="삭제하기">
	</div>
	
</div>
</main>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>