<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 어드민 페이지의 헤더 -->
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<script>
function wtwriteform_check(){
	var wt_start = document.getElementById("WT_START");
	var wt_end = document.getElementById("WT_END");
	
	if(wt_start.value == ""){//몸무게 시작 입력값이 없을경우
		alert("시작 몸무게를 입력하세요:)");
		wt_start.focus();//커서가 깜빡이는 효과 함수줌
		return false;//false를 반환하면 아래 코드 아무것도 진행하지 말라는 의미
	}
	
	if(wt_end.value == ""){//몸무게 끝 입력값이 없을경우
		alert("종료 몸무게를 입력하세요:)");
		wt_end.focus();//커서가 깜빡이는 효과 함수줌
		return false;//false를 반환하면 아래 코드 아무것도 진행하지 말라는 의미
	}
	
	document.wtmodifrm.submit();//값 넘겨주기
}
</script>
<style>
span.fa-solid {
color:#f0b1aa;
}

#wtmodi.btn.submit{
margin-right:5px;
}
</style>
<main class="layoutCenter">

<h1 class="txt_center"><span class="fa-solid fa-paw"></span>함께해요<span class="fa-solid fa-paw"></span></h1>
	<br/>
<!-- 23.02.06 박선영 관리자 몸무게 등록 -->	
<div class="main_wrap">
<form method="post" action="/admin/together/wtmodi" name="wtmodifrm">
<input type="hidden" id="WT_IDX" name="WT_IDX" value="${map.WT_IDX }">
	<table class="wtmodi_view">
		<colgroup>
		</colgroup>
		<thead>
			<tr>
				<th>몸무게 시작 범위</th>
				<th></th>
				<th>몸무게 종료 범위</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="txt_center"><input type="text" id="WT_START" name="WT_START" value="${map.WT_START}"/></td>
				<td class="txt_center">~</td>
				<td class="txt_center"><input type="text" id="WT_END" name="WT_END" value="${map.WT_END}"/></td>
			</tr>
		</tbody>
	</table>
	<br/>
	<div class="flexCenter">
		<input type="button" id="wtmodi" class="btn submit" value="수정하기" onclick="wtwriteform_check();"/>
		<a class="btn" href="/admin/together/wtlist.paw">몸무게 목록으로</a>
	</div>
</form>
</div>
</main>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>