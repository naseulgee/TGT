<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/user-header.jspf" %>
<link type="text/css" rel="stylesheet" href="/resources/css/common/photo.css" ></link>
<script src="/resources/js/common/img_pop_slide.js"></script>

<style>
	#stars { 
		display: inline-block; 
		font-size : 50px;
	}
	
	#img_upload label{
		width : 120px;
		height : 120px;
	}
	
	#wrap {
		width:70%;
		margin: 40px auto;
	}
	
	#re_contents {
		color : #808991;
		margin : auto;
	}
	
	#place {
		padding:20px; 
		border-radius : 20px;
	}
	
 	#place {
 		width : 75%;
	    border: 1px solid;
	    border-color : #9ea7ad;
	    border-radius: 15px;
	  	box-sizing: border-box;
	    overflow: hidden;
	    box-shadow: 3px 3px 5px #d1d5d9; 
	    margin : auto;
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
	
	#writeDate{
		color : #d1d5d9;
		font-style : italic;
		font-size : 15px;
	}
	
	#mainTd {
		width : 260px;
	}
	
	main img {
		border: 3px solid #f0b1aa;
	    box-sizing: border-box;
    	border-radius: 20px;
	}
	
	hr {
		border-top : 1px dashed #9ea7ad;
	}
</style>

<script type="text/javascript">
	function recheck() {
		return confirm("정말 삭제하시겠어요?");
	};		
</script>

<!-- 컨텐츠는 꼭 main 태그로 감싸주시고, 클래스명은 layoutCenter로 지정해주세요 -->
<main class="layoutCenter">
	<div id="wrap" >	
	<div >
	
	<h1 class="txt_center">나의 리뷰</h1>
	<br><br>
	
		<div id="place">
			<table>
				<tbody>
					<tr>
						<td rowspan="5" id="mainTd">
							<img id="placePhoto" src="/resources/upload/${placePhoto.PH_STORED_FILE_NAME}"width="250px" src="/">
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
						<td>
							<c:if test="${!empty review.PL_OPEN}">
							${fn:substring(review.PL_OPEN,0,2)}:${fn:substring(review.PL_OPEN,2,4)} -
							${fn:substring(review.PL_CLOSE,0,2)}:${fn:substring(review.PL_CLOSE,2,4)}
							</c:if>
							<c:if test="${!empty review.PL_OFFDAY}"> 
								<c:forEach items="${fn:split(review.PL_OFFDAY, ',')}" var="day">
							    	<c:if test="${day == 0}">일</c:if>
									<c:if test="${day == 1}">월</c:if>
									<c:if test="${day == 2}">화</c:if>
									<c:if test="${day == 3}">수</c:if>
									<c:if test="${day == 4}">목</c:if>
									<c:if test="${day == 5}">금</c:if>
									<c:if test="${day == 6}">토</c:if>
								</c:forEach>휴무
							</c:if>
						</td>
					</tr>
					<tr>
						<td>
							<a class="use_move btn slim" href="/place/detail/${review.RE_PL_IDX}" 
							onclick="move(this, 'test:value_a')">상세보기</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<br>
		
		<div id="place">
			<!-- 평점 -->
			<div class="txt_center">
				<div  width="50%">
				<i class="fa-solid fa-paw color" id="stars"></i> &nbsp;
				<span id="star1" class="bold">${review.RE_STAR}</span>
				<span id="star2">/5점</span><br>
				</div>
				<%-- 
				<span class="color">
				    <c:forEach var="j" begin="1" end="${review.RE_STAR}">
		    			<i class="fa-solid fa-paw color" id="stars"></i>
					</c:forEach>
					<c:forEach var="j" begin="1" end="${5-review.RE_STAR}">
		    			<i class="fa-solid fa-paw subColor" id="stars"></i>
					</c:forEach>&nbsp;
				</span> 
				--%>
			</div>
			<br>
			
			<!-- 후기 -->
			<div id="re_contents" class="txt_center">
				${review.RE_CONTENTS}
			</div>	
			<br><br>
			
			<c:if test="${!empty photos}">
				<!-- 사진 -->
				<hr><br>
				<div id="img_upload" class="flex pop_img_wrap">	
					<c:forEach items="${photos}" var="i" varStatus="status">	
						<label >
							<img class="pop_img" src="/resources/upload/${i.PH_STORED_FILE_NAME}" id="photo">			
							&nbsp;
						</label>
					</c:forEach>
				</div>
				<br>
			</c:if>
			
			<div id="writeDate" class="txt_right">
				최초작성 <fmt:formatDate value="${review.RE_REG_DATE}" pattern="yy-MM-dd" /><br>
				최종수정 <fmt:formatDate value="${review.RE_MOD_DATE}" pattern="yy-MM-dd" />
			</div>			
			
		</div>
		
		<br><br>
		
		<div class="txt_center">
			<a href="/review/updateForm.paw" class="use_move btn submit" 
			onclick="move(this, 're_idx:${review.RE_IDX}','ph_board_type:review')">수정</a>
			<table>
				<form action="/review/delete.paw" method="post">
					<input type="submit" class="btn" value="삭제" onClick="return recheck();">
					<input type="hidden" id="re_idx" name="re_idx" value="${review.RE_IDX}">
					<input type="hidden" id="ph_board_type" name="ph_board_type" value="review">
				</form>
			</table>
		</div>
		
		
		

	</div>	
	</div> 
</main><!-- //main 종료 -->
<link rel="stylesheet" type="text/css" href="/resources/css/common/img_pop_slide.css"/>
<script src="/resources/js/common/img_pop_slide.js"></script>

<%@ include file="/WEB-INF/include/common-footer.jspf" %>