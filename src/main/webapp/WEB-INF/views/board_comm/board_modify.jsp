<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/include/user-header.jspf"%>
		<link href="/resources/css/board_comm/board_comm_modify.css" rel="stylesheet">
		<script src="/resources/js/board_comm/board_comm.js"></script>
	</head>
	
<main class="layoutCenter">
	<body>
		<section class="notice">
			<div class="page-title">
				<div class="container">
					<center>
						<a href="/board/list.paw"> <img
							src="/resources/image/board_comm_mongmong.PNG"></a>
					</center>
					<br> <br>
					<div class="wrapper">
						<div class="typing-demo">글을 수정 중입니다... :)</div>
					</div>
					<form action="/board/modify.paw" method="post">
						<div class="mainContainer">
								<input type="hidden" id="BC_IDX" name="BC_IDX" value="${map.BC_IDX}" /> 
								<input type="hidden" id="BC_READHIT" name="BC_READHIT" value="${map.BC_READHIT}" /> 
								<input type="hidden" id="BC_WRITER_NAME" name="BC_WRITER_NAME" value="${map.BC_WRITER_NAME}" /> 
								<input type="hidden" id="BC_REG_DATE" name="BC_REG_DATE" value="${map.BC_REG_DATE}" />

							<div class="frame1">
								<div class="title">
									<input type="text" id="BC_TITLE" placeholder="제목"
										name="BC_TITLE" value="${map.BC_TITLE }"
										style="width: 700px; height: 40px" />
								</div>
								
								<div class="fontPosition">
									<i class="fa-solid fa-user"> ${map.BC_WRITER_NAME } 님</i>
									<i class="fa-solid fa-list-ol"> ${map.BC_IDX } </i> 
								</div>
							</div>
							<br> <br>
							<div class="frame2">
								<textarea placeholder="내용을 입력해주세요." cols="150" id="BC_CONTENTS"
									name="BC_CONTENTS" style="height: 500px" class="content">${map.BC_CONTENTS}</textarea>
							</div>
							<br>
						</div>
						<br>
						<div class="lastFont">
							<a href="/board/list.paw" class="btn normal" onclick="alert('목록으로 이동하시겠습니까?');">목록으로</a> 
							<input class="btn submit" type="submit" value="수정하기" onclick="return checkConfirm();, alert('수정이 완료되었습니다');">
						</div>
					</form>
	</body>
</main>
</html>