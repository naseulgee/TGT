<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/WEB-INF/include/user-header.jspf"%>
		<link href="/resources/css/board_comm/board_comm_detail.css" rel="stylesheet">
	</head>
<style>

.title1{
margin-top: 10px;
margin-left: 10px;
margin-bottom: 10px;
color: black;
background-color: #f6eeec;
border-radius: 2em 2em 2em 2em;
  padding: 6px;
}
.title2{
margin-top: 4px;
}

</style>
<main class="layoutCenter">
		<section class="notice">
			<div class="page-title">
				<div class="container">
					<center>
						<a href="/board/list.paw"> <img src="/resources/image/board_comm_mongmong.PNG"></a>
					</center>
					<br>
					<br>
					<div>
						<div class="mainContainer">
							<div class="frame1">
							  <div class="pp flex" style="float:left">
								  	    <div class="title1" style="font-size: 15px;">
										${map.BC_BCC_NAME} 
										</div>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<div class="title2" style="font-size: 20px;">
										 <h4>${map.BC_TITLE}</h4>
										</div>
										</div>
										
									<div class="fontPosition" style="float:right;">
									<i class="fa-solid fa-user"> ${map.BC_WRITER_NAME } 님</i>
									<i class="fa-solid fa-eye"> ${map.BC_READHIT }</i>
									</div> 
							</div>
							
								<div class="frame2">
								<table class="board_view">
											<pre>${map.BC_CONTENTS }</pre>
								</table>
							<br>
									<div class="fontPosition">
									<i class="fa-solid fa-list-ol"> ${map.BC_IDX } </i> 
									${map.BC_REG_DATE }
									</div>
							</div>
						</div>
					</div>
					<br>
					<div class="lastFont">
					<a href="/board/list.paw" class="btn"  onclick="returntoList();">목록으로</a> 
					<a href="/board/modifyForm.paw?BC_IDX=${map.BC_IDX}" class="btn submit" onclick="alert('글을 수정하시겠습니까?');">수정하기</a>
					<a class="use_move btn warn" href="/board/delete.paw" onclick="move(this,'BC_IDX:${map.BC_IDX}'), alert('글을 삭제하시겠습니까?');" >삭제하기</a>
					<input type="hidden" name="BC_IDX" value="${map.BC_IDX}">
					</div>
				</div>
			</div>
		</section>
</html>