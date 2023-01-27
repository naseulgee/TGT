<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<style>
	#stars { 
		display: inline-block; 
		font-size : 20px;
	}
	
	#wrap {
		width:70%;
		margin: 40px auto;
	}
	
	#re_contents {
		width:60%;
		height:250px;

	}
	
	#place {
		padding:20px; 
		border-radius : 20px;
	}
	
 	#place {
 		width : 75%;
	    border: 3px solid;
	    border-color : #f0b1aa;
	    border-radius: 15px;
	  	box-sizing: border-box;
	    overflow: hidden;
	    box-shadow: 3px 3px 5px #d1d5d9; 
	} 
	
	
	#photo{
		border-radius : 20px;
	}
	
	#star1{
		color : #db776c;
		font-size : 60px;
	}
	
	#star2{
		color : #d1d5d9;
	}
	
	div :not(#place) {…}
	
	table tbody tr,
	table tbody tr:last-of-type{ border: none; }
	
	
	table tr th, table tr td {
		padding : 0px 10px;
	}
	
	#placePhoto {
		width : 250px;
		border-radius : 18px;
		border-color : pink;
	}
	
	#writeDate{
		color : #d1d5d9;
	}
	
	#mainTd {
		width : 260px;
	}
</style>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<div id="wrap" >	
	<div>
	<h1>나의 리뷰</h1>
	<br><br><br><br>
		<div id="place">
			<table>
				<tbody>
					<tr>
						<td rowspan="5" id="mainTd">
							<img id="placePhoto" width="250px" src="https://www.dailyvet.co.kr/wp-content/uploads/2022/04/20220405eyedeal1.jpg">
							<!-- 실제 실행할 때는 위코드를 지워주고 아래의 코드로 실행할 것 
							<img id="placePhoto" src="https://www.dailyvet.co.kr/wp-content/uploads/2022/04/20220405eyedeal1.jpg">
							-->
						</td>
					</tr>
					<tr>
						<td><h3>${review.PL_NAME}</h3>
						</td>
					</tr>
					<tr>
						<td>${review.PL_LOC}</td>
					</tr>
					<tr>
						<td>${fn:substring(review.PL_OPEN,0,2)}:${fn:substring(review.PL_OPEN,2,4)} -
							${fn:substring(review.PL_CLOSE,0,2)}:${fn:substring(review.PL_CLOSE,2,4)}
							&nbsp;
							(
							<c:if test="${review.PL_OFFDAY == 0}">일요일</c:if>
							<c:if test="${review.PL_OFFDAY == 1}">월요일</c:if>
							<c:if test="${review.PL_OFFDAY == 2}">화요일</c:if>
							<c:if test="${review.PL_OFFDAY == 3}">수요일</c:if>
							<c:if test="${review.PL_OFFDAY == 4}">목요일</c:if>
							<c:if test="${review.PL_OFFDAY == 5}">금요일</c:if>
							<c:if test="${review.PL_OFFDAY == 6}">토요일</c:if>휴무
							) 
						</td>
					</tr>
					<tr>
						<td>
							<a class="btn slim" >상세보기</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<br><br><br>
		
		<!-- 사진 -->
		<div>
			<c:forEach items="${photos}" var="i" varStatus="status">	
				<img width="200px" src="/resources/upload/${i.PH_STORED_FILE_NAME}" alt="카페 이미지" id="photo">			
				&nbsp;&nbsp;
			</c:forEach>
		</div>
		<br>
		
		<!-- 평점 -->
		<span id="star1" class="bold">${review.RE_STAR}</span>
		<span id="star2">/5점</span>
		<span class="color">
		    <c:forEach var="j" begin="1" end="${review.RE_STAR}">
    			<i class="fa-solid fa-paw color" id="stars"></i>
			</c:forEach>
			<c:forEach var="j" begin="1" end="${5-review.RE_STAR}">
    			<i class="fa-solid fa-paw subColor" id="stars"></i>
			</c:forEach>&nbsp;
		</span>
		
		<br><br><br>
		
		<!-- 후기 -->
		<div id="re_contents" class="slim_scroll">
			${review.RE_CONTENTS}
		</div>	
		
		<div id="writeDate" class="txt_left">
		최초작성일 : <fmt:formatDate value="${review.RE_REG_DATE}" pattern="yy.MM.dd" /><br>
		최종수정일 : <fmt:formatDate value="${review.RE_MOD_DATE}" pattern="yy.MM.dd" />
		</div>			
		
		<div class="txt_right">
			<button class="btn submit" id="uploadBtn" >수정</button> 
			<a href="/user/mypage/review/reviewList" class="btn">삭제</a>
		</div>
	</div>	
	</div> 
</main><!-- //main 종료 -->

<%@ include file="/WEB-INF/include/common-footer.jspf" %>