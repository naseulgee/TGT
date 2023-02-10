<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head> 
	<%@ include file="/WEB-INF/include/user-header.jspf"%>
	<link href="/resources/css/board_comm/board_comm_write.css" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/board_comm/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="/resources/js/board_comm/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
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
								<div class="title">
									<select name="BC_BCC_NAME" class="BC_BCC_NAME" id="BC_BCC_NAME">
									  <option value="자유게시판">자유게시판</option>
									  <option value="정보게시판">정보게시판</option>
									  <option value="긴급실종유기견">긴급실종유기견</option>
									  <option value="자원봉사구해요">자원봉사구해요</option>
									</select>
									
									<input type="text" id="BC_TITLE" name="BC_TITLE"
											placeholder="제목" style="width: 850px; height: 40px">
										</input>
											<input type="hidden" id="BC_WRITER_NAME" name="BC_WRITER_NAME" value="${mem_id}" />
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
							<a class="btn submit" onclick="returntoList();">목록으로</a>
						</div>
						</form>
					</div>
					</div>
		</section>
</main>
</html>