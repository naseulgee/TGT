<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<style>
	#stars { 
		display: inline-block; 
		font-size : 55px;
	}
	
	#wrap {
		width:70%;
		margin: 40px auto;
	}
	
	#re_contents {
		width:60%;
		height:250px;
		margin:0 auto; 
		overflow : auto;
	}
	
	#place {
		padding:20px; 
		background-color : #f0b1aa;
		border-radius : 20px;
		color : white;
	}
	
	#photo{
		border-radius : 20px;
	}
	
	#star1{
		color : #db776c;
		font-size : 40px;
	}
	
	#star2{
		color : #d1d5d9;
	}
</style>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<div id="wrap">	
	
	<h1 class="txt_center">나의 리뷰</h1>
	<br><br><br><br>
 	<div name="reviewStars" id="reviewStars" class="txt_center">
		
			<table class="card_table row1">
				<thead><!-- 테이블 테그의 제목 -->
					<tr>
						<th>제목 열1</th><!-- th태그 사용 -->
						<th>제목 열2</th>
						<th>제목 열3</th>
						<th>제목 열4</th>
					</tr>
				</thead>
				<tbody><!-- 테이블 태그의 내용 -->
					<tr>
						<td><h2>${review.PL_NAME}</h2></td><!-- td태그 사용 -->
						<td><img width="200px" src="https://www.dailyvet.co.kr/wp-content/uploads/2022/04/20220405eyedeal1.jpg"></td>
						<td>${review.PL_LOC}</td>
						<td>${fn:substring(review.PL_OPEN,0,2)}:${fn:substring(review.PL_OPEN,2,4)} -
							${fn:substring(review.PL_CLOSE,0,2)}:${fn:substring(review.PL_CLOSE,2,4)}
						</td>
					</tr>
				</tbody>
			</table>

		
		<br><br>
		
		<!-- 평점 -->
		<h3 class="color">
		    <c:forEach var="j" begin="1" end="${review.RE_STAR}">
    			<i class="fa-solid fa-paw color" id="stars"></i>
			</c:forEach>
			<c:forEach var="j" begin="1" end="${5-review.RE_STAR}">
    			<i class="fa-solid fa-paw subColor" id="stars"></i>
			</c:forEach>&nbsp;
		</h3>
		<span id="star1" class="bold">${review.RE_STAR}</span>
		<span id="star2">/5점</span>
		
		<br><br><br>
		
		<!-- 후기 -->
		<div id="re_contents" class="txt_left slim_scroll">
			${review.RE_CONTENTS}
		</div>		
		
		<br><br><br>
		
		<!-- 사진 -->
		<div>
			<c:forEach items="${photos}" var="i" varStatus="status">	
				<img src="/resources/upload/${i.PH_STORED_FILE_NAME}" alt="카페 이미지" id="photo">			
				<br><br>
			</c:forEach>
		</div>
		<br><br><br>
		
		
		<button class="btn submit" id="uploadBtn" >수정</button> 
		<a href="/user/mypage/review/reviewList" class="btn">삭제</a>
		
	</div> 
	</div>
</main><!-- //main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf" %>