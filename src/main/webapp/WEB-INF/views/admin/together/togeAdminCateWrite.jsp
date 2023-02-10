<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 어드민 페이지의 헤더 -->
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<script src="https://kit.fontawesome.com/e9bd4d3977.js" crossorigin="anonymous"></script>
<script>
function catewriteform_check(){
	var tc_name = document.getElementById("TC_NAME");
	
	if(tc_name.value == ""){//제목 입력값이 없을경우
		alert("분류이름을 입력하세요:)");
		to_title.focus();//커서가 깜빡이는 효과 함수줌
		return false;//false를 반환하면 아래 코드 아무것도 진행하지 말라는 의미
	}
	
	document.catewritefrm.submit();//값 넘겨주기
}
</script>
<style>
span.fa-solid {
color:#f0b1aa;
}

#ctreg.btn.submit{
margin-right:5px;
}
</style>

<main class="layoutCenter">

<h1 class="txt_center"><span class="fa-solid fa-paw"></span>함께해요<span class="fa-solid fa-paw"></span></h1>
	<br/>
<!-- 23.01.25 박선영 관리자 카테고리 등록 -->	
<div class="main_wrap">
<form method="post" action="/admin/together/catewrite.paw" name="catewritefrm">
	<table class="board_view">
		<colgroup>
		</colgroup>
		<thead>
			<tr>
				<th>함께해요 분류 이름</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="txt_center"><input type="text" id="TC_NAME" name="TC_NAME" placeholder="입력해주개:)"/></td>
		</tbody>
	</table>
	<br/>
	<div class="flexCenter">
		<input type="button" id="ctreg" class="btn submit" value="등록하기" onclick="catewriteform_check();"/>
		<a class="btn" href="/admin/together/catelist.paw">카테고리 목록으로</a>
	</div>
	</form>
</div>
</main>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>