<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 어드민 페이지의 헤더 -->
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<style>
span.fa-solid {
color:#f0b1aa;
}

#wtmodi{
border-color : #f0b1aa;
background-color : #f0b1aa;
color : white;
padding-top : 5px;
padding-right : 10px;
padding-bottom : 5px;
padding-left : 10px;
font-size: 16px;
display : inline-block;
border: 1px;
border-radius : 5px;
margin-right : 5px;
}

</style>
<main class="layoutCenter">

<h1 class="txt_center"><span class="fa-solid fa-paw"></span>함께해요<span class="fa-solid fa-paw"></span></h1>
	<br/>
<!-- 23.02.22 박선영 관리자 몸무게 상세보기 -->	
<div class="main_wrap">
	<table class="wt_detail">
			<thead>
				<tr>
					<th>몸무게 번호</th>
					<th>몸무게 시작 범위</th>
					<th>몸무게 종료 범위</th>
				</tr>
			</thead>		
				
			<tbody>
				<tr class="txt_center">
					<td>${map.WT_IDX}</td>
					<td>${map.WT_START } kg</td>
					<td>${map.WT_END } kg</td>
				</tr>
			</tbody>
		</table>
		<br/>
		<div class="flexCenter">
			<a class="use_move" id="wtmodi" href="/admin/together/wtmodiForm" onclick="move(this,'WT_IDX:${map.WT_IDX}')">몸무게 수정하기</a>
			<a class="btn" href="/admin/together/wtlist">목록으로</a>
		</div>
</div>
</main>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>