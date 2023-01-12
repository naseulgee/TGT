<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
</head>

<main class="layoutCenter">
<h4>멍멍왈왈 게시글 작성</h4>
<body>
<form id="frm">
<div align="center">
		<table class="board_view">
			<colgroup>
				<col width="10%">
			</colgroup>
			<tbody>
				<tr>
					<th>제목</th>
					<td><input type="text" id="TITLE" name="TITLE" class="wdp_90" style="width:700px"></input></td>
				</tr>
				<tr>
					<td colspan="2" class="view_text">
						<pre><textarea rows="100" cols="100" title="내용" id="CONTENTS" name="CONTENTS" style="height:500px"></textarea></pre>
					</td>
				</tr>
			</tbody>
		</table>
		<br>
		<a class="btn submit" href="#">작성하기</a>
		</div>
	</form>
</body>
</main>
</html>