<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/user-header.jspf"%>
<link href="/resources/css/board_comm/board_comm_detail.css"
	rel="stylesheet">
<script src="/resources/js/board_comm/board_comm.js"></script>
</head>
<style>
.title1 {
	margin-top: 10px;
	margin-left: 10px;
	margin-bottom: 10px;
	color: black;
	background-color: #f6eeec;
	border-radius: 2em 2em 2em 2em;
	padding: 6px;
}

.title2 {
	margin-top: 4px;
}
</style>


<main class="layoutCenter">
	<section class="notice">
		<div class="page-title">
			<div class="container">
				<center>
					<a href="/board/list.paw"> <img
						src="/resources/image/board_comm_mongmong.PNG"></a>
				</center>
				<br> <br>
				<div>
				<!-- -----------------------------게시글 디테일----------------------------------------- -->
					<div class="mainContainer">
						<div class="frame1">
							<div class="pp flex" style="float: left">
								<div class="title1" style="font-size: 15px;">
									${map.BC_BCC_NAME}</div>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="title2" style="font-size: 20px;">
									<h4>${map.BC_TITLE}</h4>
								</div>
							</div>

							<div class="fontPosition" style="float: right;">
								<i class="fa-solid fa-user"> ${map.BC_WRITER_NAME } 님</i> <i
									class="fa-solid fa-eye"> ${map.BC_READHIT }</i>
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
					<a href="/board/list.paw" class="btn" onclick="returntoList();">목록으로</a>
					<a href="/board/modifyForm.paw?BC_IDX=${map.BC_IDX}"
						class="btn submit" onclick="alert('글을 수정하시겠습니까?');">수정하기</a> <a
						class="use_move btn warn" href="/board/delete.paw"
						onclick="move(this,'BC_IDX:${map.BC_IDX}'), alert('글을 삭제하시겠습니까?');">삭제하기</a>
					<input type="hidden" name="BC_IDX" value="${map.BC_IDX}">
				</div>
				<br> <br>

				<!-- -----------------------------댓글 목록----------------------------------------- -->
				<i class="fa-solid fa-comments">댓글</i> <br>
				<table class="comment-table" id="comment-table">
					<tbody>
						<c:choose>
							<c:when test="${fn:length(comment) > 0}">
								<c:forEach items="${comment}" var="comment" varStatus="i">
									<div class="row">
										<tr>

											<td width="80%"><input type="hidden" name="RNO"
												id="RNO_val" value="${comment.RNO }"> <i
												class="fa-solid fa-user-large" style="font-size: 14px;">
													&nbsp; ${comment.WRITER }</i> <br> ${comment.CONTENT } <br>
											</td>
											<td width="20%" style="font-size: 14px;"><fmt:formatDate
													value="${comment.REGDATE}" pattern="yyyy-MM-dd" />
												<button type="button" onclick="modifyView(this.id)"
													id="modify${i.count }">
													<%-- <button onclick="cmUpdateFun(${comment.RNO})"> --%>
													수정하기
												</button>
												<button onclick="cmDeleteFun(${comment.RNO})">삭제하기</button>
											</td>
										</tr>
									</div>

									<!-- -----------------------------수정 눌렀을시 댓글 나타남----------------------------------------- -->
									<tr class="modifyViews">
										<form action="/comment/modify.paw" method="post">
											<td><input type="hidden" name="BC_IDX" id="BNO"
												value="${map.BC_IDX }" /> <input type="hidden" name="RNO"
												id="RNO" value="${comment.RNO}" /> <textarea
													style="width: 1200px; height: 100px;"
													placeholder="내용을 작성하세요" name="CONTENT"> ${comment.CONTENT}</textarea>
											</td>
											<td>
												<button>수정</button>
											</td>
										</form>
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
				
				<!------------------------------------ 댓글 작성 -------------------------------------->
				
				<br> 
				<input type="hidden" name="BNO" id="BNO" value="${map.BC_IDX}" />
				<input type="hidden" name="WRITER" id="WRITER" value="${mem_id}">
				<textarea placeholder="댓글을 입력해주세요." name="CONTENT" id="CONTENT" style="width: 1300px; height: 100px;"></textarea>
				<br> 
				<br>
				<button class="btn submit" id="btn" name="btn" style="float: right">댓글 작성</button>
				
			</div>
		</div>
	</section>
</main>
<script>
$(function(){
	
$('#btn').click(function() {
	
	const BNO = ${map.BC_IDX};
	const CONTENT = $('#CONTENT').val();
	const WRITER = $('#WRITER').val();
	
	
			$.ajax({
				type:'post',
				url: "/comment/write.paw",
				data: 
					{
						"BNO":BNO,
						"CONTENT":CONTENT,
						"WRITER":WRITER,
					},		
				dataType: "text",
				success: function (data) {
					$("CONTENT").html(data);
					$("BNO").html(data);
					$("WRITER").html(data);
					location.reload();
				},
				error:function(data){
					alert('댓글 작성 실패');
				}
		});
	});

});


var modifyViews = document.getElementsByClassName('modifyViews')

for (var i = 0; i < modifyViews.length; i++) {
	modifyViews[i].style.display = 'none'
}

function modifyView(idI) {
	var modifiId = document.getElementById(idI);
	
	modifiId.parentElement.parentElement.style.display = 'none';
	modifiId.parentElement.parentElement.nextElementSibling.style.display = '';

}



function cmDeleteFun(rno){

	
	const BNO = ${map.BC_IDX};

	$.ajax({
		type:'post',
		url: "/comment/delete.paw",
		data:
				{
					"RNO":rno,
					"BNO":BNO
				},
		dataType: "text",
		success: function (data) {

			location.reload();
		},
		error:function(data){
			alert('댓글 삭제 실패');
		}
	});

}

</script>
</html>

