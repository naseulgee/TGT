<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/include/admin-header.jspf" %>
<link type="text/css" rel="stylesheet" href="/resources/css/common/photo.css" ></link>
<style>
	#highlight {
	color : #db776c;
	background-color: var(--subColor);
	}
	
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
	
	
	table tr th, table tr td { padding : 0px 10px; }
	
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

<main class="layoutCenter">
	<div id="wrap" >	
	<div >
	
	<h1 class="txt_center">회원 리뷰상세</h1>
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
			<!-- 누가, 언제, 어떤 시설에 대해 작성한 리뷰인지에 대한 설명 -->
			<div class="txt_center">
			<span id="highlight">${review.RE_WRITER_NAME}(${review.RE_WRITER_ID})</span>님이
			<span id="highlight"><fmt:formatDate value="${review.RE_REG_DATE}" pattern="yy-MM-dd" /></span>에 작성하신 
			<span id="highlight">${review.PL_NAME}</span>에 대한 리뷰입니다.
			</div>
			
			<!-- 평점 -->
			<div class="txt_center">
				<div  width="50%">
				<i class="fa-solid fa-paw color" id="stars"></i> &nbsp;
				<span id="star1" class="bold">${review.RE_STAR}</span>
				<span id="star2">/5점</span><br>
				</div>
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
			<form action="/admin/review/delete.paw" method="post">
				<input type="submit" class="btn warn" value="삭제" onClick="return recheck();">
				<input type="hidden" id="re_idx" name="re_idx" value="${review.RE_IDX}">
				<input type="hidden" id="ph_board_type" name="ph_board_type" value="review">
			</form>
		</div>
		

	</div>	
	</div> 
</main><!-- //main 종료 -->
<link rel="stylesheet" type="text/css" href="/resources/css/common/img_pop_slide.css"/>
<script src="/resources/js/common/img_pop_slide.js"></script>
<%@ include file="/WEB-INF/include/common-footer.jspf" %>