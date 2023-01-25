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

<script>


</script>
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
					<br>
					<br>
					
					<!-- 댓글 목록 -->
					<i class="fa-solid fa-comments">댓글</i>
				<table class="comment-table" id="comment-table">
						<tbody>
							<c:choose>
								<c:when test="${fn:length(comment) > 0}">
									<c:forEach items="${comment}" var="comment">
										<tr align="center">
											<td >${comment.WRITER }</td>
											<td >${comment.CONTENT }</td>
											<td >${comment.REGDATE}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4">조회된 결과가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
						</table>
						<br>
						<Br>
						
				<!-- 댓글 등록 -->
				<form id="board_comment" name="board_comment" method="post" action="/comment/write.paw">
				<div class="contentPosition">
					<input type="hidden" name="BNO" id="BNO" value="${map.BC_IDX}" />
						<textarea placeholder="댓글을 입력해주세요." name="CONTENT" id="CONTENT" style="width:1300px;height:100px;"></textarea>
						</div>
						<br>
						<%-- <a class="use_move btn warn" href="/board/detail.paw" onclick="move(this,'BNO:${map.BC_IDX}');">댓글작성</a> --%>
						<button class="btn submit" type="submit" style="float:right;">댓글 작성</button>
				</form>
			</div>
			</div>
		</section>
</html>
<script>

$("#board_comment").on("click",function(e){
	e.preventDefault();
	$form=$(this).closest("form[name='board_comment']");
	
	$.ajax({
		url:"<c:url value='/comment/write'/>"
		,type : "POST"
		,dataType :"data"
		,data : $form.serialize()
		,success: function(data){
			console.log(data);
			$form.find("textarea[name='CONTENT']").val('');
			$("#comment-table").html('');
			comment-table();
		}
		error: function (data) {
			alert('error');
		}
		}
	});//ajax 
});//등록버튼

</script>