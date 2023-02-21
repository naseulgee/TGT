<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 어드민 페이지의 헤더 -->
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<script>
function delcheck(){
	var tc_count = document.getElementById("TC_COUNT");
	
	if(tc_count.value != '0'){//tc_count가 있을경우
		alert("게시글이 있어서 삭제가 불가합니다:(");
		return false;//false를 반환하면 아래 코드 아무것도 진행하지 말라는 의미
	}
	
	document.catedel.submit();//값 넘겨주기
}
</script>
<style>
span.fa-solid {
color:#f0b1aa;
}

#ctreg{
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

input.btn.warn{
margin-right : 5px;
}
</style>
<main class="layoutCenter">

<h1 class="txt_center"><span class="fa-solid fa-paw"></span>함께해요<span class="fa-solid fa-paw"></span></h1>
	<br/>
<!-- 23.02.21 박선영 관리자 카테고리 상세보기 -->	
<div class="main_wrap">
	<table class="cate_detail">
		<thead>
			<tr>
				<th>함께해요 분류 번호</th>
				<th>함께해요 분류 이름</th>
				<th>함께해요 분류 게시글 수</th>
			</tr>
		</thead>		
			
		<tbody>
			<tr class="txt_center">
				<td>${map.TC_IDX}</td>
				<td>${map.TC_NAME }</td>
				<td>${map.TC_COUNT }</td>
			</tr>
		</tbody>
	</table>
	<br/>
	<div class="flexCenter">
		<c:if test="${map.TC_COUNT == 0 }"><!-- 분류의 게시글이 없을때만 수정할 수 있도록 -->
			<a class="use_move" id="ctreg" href="/admin/together/catemodiForm" onclick="move(this,'TC_IDX:${map.TC_IDX}')">분류수정하기</a>
		</c:if>
		<!-- 게시글이 있는지 확인 후분류 삭제 -->
			<form id="catedel" name="catedel" method="post" action="/admin/together/catedel">
				<input type="button" class="btn warn" id="ctdel" onclick="delcheck();" value="분류삭제하기">
				<input type="hidden" id="TC_COUNT" name="TC_COUNT" value="${map.TC_COUNT}"/>
				<input type="hidden" id="TC_IDX" name="TC_IDX" value="${map.TC_IDX}">
			</form>
			<a class="btn" href="/admin/together/catelist.paw">목록으로</a>
	</div>
</div>
</main>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>