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
<form id="frm">
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

		<a class="btn submit" href="/board_list.paw" id="write">작성하기</a>
		<a class="btn submit" href="/board_list.paw" id="list">목록으로</a>
		
	</form>
	
	<script type="text/javascript">

	$(document).ready(function(){
		$("#list").on("click", function(e){ //목록으로 버튼
			e.preventDefault();
			fn_openBoardList();
		});
		
		$("#write").on("click", function(e){ //작성하기 버튼
			e.preventDefault();
			fn_insertBoard();
		});
	});

	function fn_openBoardList(){
		var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='/board_list.paw' />");
		comSubmit.submit();
	}

	function fn_insertBoard(){
		var comSubmit = new ComSubmit("frm");
		comSubmit.setUrl("<c:url value='/board_list.paw' />");
		comSubmit.submit();
	}
	
	</script>
	
</body>
	
</main>
</html>