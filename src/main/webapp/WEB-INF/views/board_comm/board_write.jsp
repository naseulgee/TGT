<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/user-header.jspf"%>
</head>

<main class="layoutCenter">

<h4>멍멍왈왈 게시글 작성</h4>
<br>
<body>
<form id="frm" action="/board_write.paw" method="post">
<div align="center">
		<table class="board_view">
			<colgroup>
				<col width="10%">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td>
					<input type="text" id="BC_TITLE" name="BC_TITLE" class="wdp_90" style="width:700px">					
					</input></td>
				</tr>
				<tr>
					<td colspan="2" class="view_text">
						<textarea rows="20" cols="100" title="내용" id="BC_CONTENTS" name="BC_CONTENTS" style="height:500px"></textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<br>

		<input class="btn submit" type="submit" value="작성하기">
		<a class="btn submit" href="/board_list.paw">목록으로</a>
		
	</form>
	
</body>
	
</main>
</html>