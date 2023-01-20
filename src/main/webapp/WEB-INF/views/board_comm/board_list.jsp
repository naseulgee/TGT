<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/user-header.jspf"%>
<link href="/resources/css/board_comm/board_comm_list.css"
	rel="stylesheet">
<link rel="stylesheet" href="/resources/css/board_comm/toastr.css"
	integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="/resources/js/board_comm/toastr.min.js"
	integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>




<script>
	/* 이 페이지에서만 적용되는 제이쿼리라 따로 빼놈 - 등록 완료 후 이벤트 처리 */
	$(function() {
		if ('${success}') {
			toastr.success('${success}');

		}
		if ('${warning}') {
			toastr.warning('${warning}');

		}
		if ('${info}') {
			toastr.info('${info}');

		}
		if ('${error}') {
			toastr.info('${error}');
		}
	});
	
	/*  $(function(){
	    $('#tab_b').on('click',reqAjax1);
	    
	})
	
	function reqAjax1() {
	    $.ajax({
	        url: "/board/list.paw?BC_BCC_NAME="+BC_BCC_NAME
	        , method : 'GET'
	        , success :  function(data) {
				$('#BC_BCC_NAME').html(data);
				
			},
			error: function(request, status, error) {
				alert(error);
			}
	    })
	} */
 
	
	/*  function refreshList(){
		$("#BC_BCC_NAME").on("change", function(){
			var BC_BCC_NAME = $(this).val();
			location.href="/board/list.paw?BC_BCC_NAME="+BC_BCC_NAME;
		})
	}  */
	
	
	 
	
	 
	/* $(function(){
	    
	    $("input:radio[name='BC_BCC_NAME']").on('click',function(){
	        
	    	var kind = $(this).val();
	    	
	        $.ajax({
	            
	            url : "/board/list.paw?BC_BCC_NAME="+BC_BCC_NAME
	           
	            data : {
	            	
	                 id : $(this).val(),
	                "kind":kind    
	            },
	            success : function(data){
	                console.log(data);
	                $('body').html(data); 
	            },
	            error : function(data){
	                alert('error');
	            }
	        })
	    });
	    
	});  */
	
	$(function refreshList() {
		$("radio").on("click", getData);
	});

	
	
	function getData() {
		
		$.ajax({
			type:"get", 
			url:"/board/list.paw?BC_BCC_NAME="+BC_BCC_NAME ,
			data : {
				BC_BCC_NAME : $(this).val()
           },
            dataType:"text",
			success: function (data, status, xhr) {
				$("tbody").text(data);
			},
			error: function(data){
                alert('error');
			}
		});
	}
	 
</script>

<main class="layoutCenter">
	<body>
		<section class="notice">
			<div class="page-title">
				<div class="container">
					<center>
						<a href="/board/list.paw"> <img
							src="/resources/image/board_comm_mongmong.PNG">
						</a>
					</center>
				</div>
			</div>
			<!-- board seach area -->
			<div id="board-search">
				<div class="container">
					<br>
					<div class="search-window">
						<form action="">
							<div class="search-wrap">
								<label for="search" class="blind">멍멍왈왈 내용 검색</label> <input
									id="search" type="search" name="" placeholder="검색어를 입력해주세요."
									value=""> <a class="btn submit" href="#">검색</a>
							</div>
						</form>
					</div>
				</div>
			</div>

			<!-- board list area -->
			<div id="board-list">
				<div class="container">
					<table class="board-table">
						<thead>
							<tr>
							<div>
								<div class="tab_radio" >
									<input type="radio" id="tab_a" name="BC_BCC_NAME" value="전체게시판"><label for="tab_a">전체게시판</label> 
									<input type="radio" id="tab_b" name="BC_BCC_NAME" value="자유게시판"><label for="tab_b">자유게시판</label> 
									<input type="radio" id="tab_c" name="BC_BCC_NAME" value="정보게시판"><label for="tab_c">정보게시판</label>
									<input type="radio" id="tab_d" name="BC_BCC_NAME" value="긴급실종유기견"><label for="tab_d">긴급실종유기견</label>
									<input type="radio" id="tab_f" name="BC_BCC_NAME" value="자원봉사구해요"><label for="tab_f">자원봉사구해요</label>
								</div>
							<br>
								<!-- <th width="5%">NO.</th>
								<th width="15%">
									
										<select name="BC_BCC_NAME" class="BC_BCC_NAME"
											id="BC_BCC_NAME" style="height: 30px;" onchange="refreshList()">
											<option value="전체게시판">전체게시판</option>
											<option value="자유게시판">자유게시판</option>
											<option value="정보게시판">정보게시판</option>
											<option value="긴급실종유기견">긴급실종유기견</option>
											<option value="자원봉사구해요">자원봉사구해요</option>
										</select>
								</th>
								
								<th width="45%">제목</th>
								<th width="5%">조회수</th>
								<th width="10%">작성자</th>
								<th width="10%">작성일</th> -->
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(list) > 0}">
									<c:forEach items="${list }" var="row">
										<tr align="center" class="use_move"
											data-href="/board/detail.paw"
											onclick="move(this,'BC_IDX:${row.BC_IDX}')">
											<td width="5%">${row.BC_IDX }</td>
											<td width="15%">${row.BC_BCC_NAME }</td>
											<td width="45%">${row.BC_TITLE }</td>
											<td width="5%">${row.BC_READHIT }</td>
											<td width="10%">${row.BC_WRITER_ID }</td>
											<td width="10%"><fmt:formatDate
													value="${row.BC_MOD_DATE}" pattern="yyyy-MM-dd" /></td>
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
					<br> <a href="/board/writeForm.paw" class="btn submit" style="float: right">글쓰기</a>
				</div>
			</div>
			<br>
		</section>
	</body>
</main>
</html>
