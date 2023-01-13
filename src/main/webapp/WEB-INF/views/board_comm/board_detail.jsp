<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/user-header.jspf"%>
</head>

<main class="layoutCenter">

<body>
	<table class="board_view">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		<caption>게시글 상세</caption>
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${map.BC_IDX }</td>
				<th scope="row">조회수</th>
				<td>${map.BC_READHIT }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${map.BC_WRITER_NAME }</td>
				<th scope="row">작성시간</th>
				<td>${map.BC_REG_DATE }</td>
			</tr>
			<tr>
				<th scope="row">제목</th>
				<td colspan="3">${map.BC_TITLE }</td>
			</tr>
			<tr>
				<td colspan="4">${map.BC_CONTENTS }</td>
			</tr>
		</tbody>
	</table>
	<a href="/board_list.paw" class="btn">목록으로</a>
	<a href="/board_modifyForm.paw" class="btn" >수정하기</a>

</body>
</body>
</html>