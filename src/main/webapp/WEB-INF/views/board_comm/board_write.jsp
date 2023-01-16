<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/include/user-header.jspf"%>
		<link href="/resources/css/board_comm/board_comm_write.css" rel="stylesheet">
		<script src="/resources/js/board_comm/board_comm.js"></script>
	</head>


<main class="layoutCenter">
		<section class="notice">
			<div class="page-title">
				<div class="container">
					<center>
						<a href="/board/list.paw"> <img src="/resources/image/board_comm_mongmong.PNG"></a>
					</center>
					<br> <br>
					<div class="wrapper">
						<div class="typing-demo">새로운 글을 작성 중입니다... :)</div>
					</div>
						<div class="mainContainer">
							<form id="frm" action="/board/write.paw" method="post">
								<div class="frame1">
								
									<select name="BC_BCC_NAME" class="BC_BCC_NAME">
									  <option disabled selected>게시판 유형</option>
									  <option value="category1">자유게시판</option>
									  <option value="category2">정보게시판</option>
									  <option value="category3">긴급실종유기견</option>
									  <option value="category4">자원봉사&후원요청</option>
									</select>
									
									<div class="title">
										<input type="text" id="BC_TITLE" name="BC_TITLE"
											placeholder="제목" style="width: 800px; height: 40px">
										</input>
									</div>
								</div>
								<br> <br>
								<div class="frame2">
									<textarea placeholder="내용을 입력해주세요." cols="150" id="BC_CONTENTS" name="BC_CONTENTS" style="height: 500px" class="content"></textarea>
								</div>
								<br>
						</div>
						<br>
						<div class="lastFont">
							<input class="btn submit" type="submit" value="작성하기" onclick="return checkConfirm();"> 
							<a class="btn submit" href="/board/list.paw" onclick="alert('목록으로 이동하시겠습니까?');">목록으로</a>
						</div>
						</form>
					</div>
					</div>
		</section>
</main>
</html>