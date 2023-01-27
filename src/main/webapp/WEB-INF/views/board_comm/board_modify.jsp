<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/user-header.jspf"%>
<link href="/resources/css/board_comm/board_comm_modify.css" rel="stylesheet">
<script src="/resources/js/board_comm/board_comm.js"></script>

<style>
 
.title1{
margin-top: 10px;
margin-left: 10px;
margin-bottom: 10px;
color: black;
border-radius: 2em 2em 2em 2em;
padding: 6px;
font-size: 15px;
}
.title2{ 
margin-top: 15px;
font-size: 13px;

}

</style>


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
						<div class="typing-demo">글을 수정중입니다... :)</div>
					</div>
					<div class="mainContainer">
					<form action="/board/modify.paw" method="post">
								<input type="hidden" id="BC_IDX" name="BC_IDX" value="${map.BC_IDX}" /> 
								<input type="hidden" id="BC_READHIT" name="BC_READHIT" value="${map.BC_READHIT}" /> 
								<input type="hidden" id="BC_WRITER_NAME" name="BC_WRITER_NAME" value="${map.BC_WRITER_NAME}" /> 
								<input type="hidden" id="BC_REG_DATE" name="BC_REG_DATE" value="${map.BC_REG_DATE}" />

							<div class="frame1">
							 <div class="pp flex" style="float:left">
								  	    <div class="title1">
									<select name="BC_BCC_NAME" class="BC_BCC_NAME" id="BC_BCC_NAME">
									  <option value="자유게시판">자유게시판</option>
									  <option value="정보게시판">정보게시판</option>
									  <option value="긴급실종유기견">긴급실종유기견</option>
									  <option value="자원봉사구해요">자원봉사구해요</option>
									</select>
									</div>
									
										<div class="title2">
									<input type="text" id="BC_TITLE" placeholder="제목"
										name="BC_TITLE" value="${map.BC_TITLE }"
										style="width: 700px; height: 35px" />
										</div>
								</div>
								
								<div class="fontPosition" style="float:right">
									<i class="fa-solid fa-user"> ${map.BC_WRITER_NAME } ë</i>
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
							<a href="/board/list.paw" class="btn normal" onclick="returntoList();">목록으로</a> 
							<input class="btn submit" type="submit" value="수정하기" onclick="return checkConfirm();">
						</div>
			</form>
	</body>
</main>
</html>