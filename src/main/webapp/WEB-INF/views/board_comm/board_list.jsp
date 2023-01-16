<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/user-header.jspf"%>
<link href="/resources/css/board_comm/board_comm_list.css" rel="stylesheet">
</head>

<main class="layoutCenter">
	<body>
		<section class="notice">
			<div class="page-title">
				<div class="container">
						<center>
						<a href="/board/list.paw"> 
						<img src="/resources/image/board_comm_mongmong.PNG">
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
								<th width="5%">NO.</th>
								<th width="5%">카테고리</th>
								<th width="60%">제목</th>
								<th width="10%">조회수</th>
								<th width="10%">작성자</th>
								<th width="10%">작성일</th>

							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(list) > 0}">
									<c:forEach items="${list }" var="row">

										<tr align="center" class="use_move" data-href="/board/detail.paw"
											onclick="move(this,'BC_IDX:${row.BC_IDX}')">
											<td width="5%">${row.BC_BCC_NAME }</td>
											<td width="10%">${row.BC_IDX }</td>
											<td width="50%">${row.BC_TITLE }</td>
											<td width="5%">${row.BC_READHIT }</td>
											<td width="5%">${row.BC_WRITER_ID }</td>
											<td><fmt:formatDate value="${row.BC_MOD_DATE}" pattern="yyyy-MM-dd" /></td>
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
					<a href="/board/writeForm.paw" class="btn submit" style="float: right">글쓰기</a>
				</div>
			</div>
			<br> 
		</section>
	</body>
</main>
</html>
