<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<script src="/resources/js/paging/paging.js"></script>
<link href="resources/css/main/main.css" rel="stylesheet">

<main class="layoutCenter">
	<div>
		<br><br>
		<!-- <h4>전체 검색</h4> -->
	</div>
	<div class="container2" >
		<div align="center" class="search">
			<form action="/search.paw" method="POST">
				<div>
					<select name="searchType" id="searchType">
						<option value="all">-----</option>
						<option value="t"
							<c:out value="${searchType eq 't'?'selected':''}"/>>제목</option>
						<option value="w"
							<c:out value="${searchType eq 'w'?'selected':''}"/>>작성자</option>
					</select> 
					<input type="text" class="txt" placeholder="Search" name="keyword" id="keyword" value="${keyword}" width="150"/>&nbsp; 
					<input type="submit" value="검색" class="btn submit" />
				</div>
			</form>
		</div>
		<div>
			<div class="tab_radio">
				<input type="radio" id="tab_a" name="tab" value="a" checked> <label for="tab_a">게시판</label> 
				<input type="radio" id="tab_b" name="tab" value="b" > 		 <label for="tab_b">함께해요</label> 
				<input type="radio" id="tab_c" name="tab" value="c"> 		 <label for="tab_c">시설</label>
			</div>
			
			<div id="searchResult">
				<div  id="boardForm">
					<jsp:include page="/search/board.paw" ></jsp:include>
				</div>
				<br>
				<div  id="togetherForm">
					<jsp:include page="/search/together.paw"></jsp:include>
				</div>
				<div  id="placeForm">
					<jsp:include page="/search/place.paw"></jsp:include>
				</div>
			</div>
			
	</div>
	<!-- <div id="PAGE_NAVI"></div>
				<input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX" />
				<br /> -->
	</div>
	
	<script type="text/javascript" src="/resources/js/main/main.js"></script>
</main>
