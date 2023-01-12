<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/user-header.jspf"%>
</head>

<main class="layoutCenter">
<body>

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
				<td>${map.BC_TITLE }</td>
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
	<a href="/board_list.paw" class="btn" id="list">목록으로</a>
	<a href="" class="btn" id="update">수정하기</a>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#update").on("click", function(e){
				e.preventDefault();
				fn_openBoardUpdate();
			});
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openBoardList.do' />");
			comSubmit.submit();
		}
		
		function fn_openBoardUpdate(){
			var idx = "${map.IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/sample/openBoardUpdate.do' />");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		}
	</script>
</body>
</body>
</html>