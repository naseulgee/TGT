<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 어드민 페이지의 헤더 -->
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<style>
span.fa-solid {
color:#f0b1aa;
}

tr#trname{
font-weight : bold; 
}

td#withname{
font-weight : bold;
font-size : 20px;
}

input#delwith{
margin-left : 5px;
}
</style>
<main class="layoutCenter">
<div class="main_wrap">
<h1 class="txt_center"><span class="fa-solid fa-paw"></span>함께해요<span class="fa-solid fa-paw"></span></h1>
<br/>
	<table>
		<thead>
			<tr>
				<td colspan="3" align="center" id="withname">회원이름 : ${map.MEM_ID }</td>
			</tr>
		</thead>
		<tbody>
			<tr class="txt_center" id="trname">
				<td>강아지이름</td>
				<td>견종</td>
				<td>몸무게</td>
			</tr>
			<tr class="txt_center" id="trvalue">
				<td>${map.MEM_DOG_NAME}</td>
				<td>${map.BR_NAME}</td>
				<td>${map.MEM_DOG_WEIGHT} kg</td>
			</tr>
		</tbody>
	</table>
	<br/>	
	<div class="flexCenter">
		<a class="btn submit" href="/admin/together/list">목록으로</a>
		<form id="withdel" name="withdel"><!-- 참여취소버튼 -->
			<input type="hidden" id="TW_TO_IDX" name="TW_TO_IDX" value="${map.TW_TO_IDX}">
			<input type="hidden" id="TW_MEM_ID" name="TW_MEM_ID" value="${map.MEM_ID}">
			<input type="button" class="btn warn" id="delwith" name="delwith" value="참여취소하기">
		</form>
	</div>
</div>
</main>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>